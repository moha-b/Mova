import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mova/core/resources/colors.dart';
import 'package:mova/core/widgets/rounded_container.dart';
import 'package:mova/domain/entities/detail_entity.dart';

import '../../../core/util/constance.dart';
import '../../../core/util/enums.dart';
import '../../../domain/entities/genre_entity.dart';
import '../bloc/detail_bloc.dart';

class MovieTextDetailComponent extends StatelessWidget {
  const MovieTextDetailComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DetailEntity? movie;
    return BlocBuilder<DetailBloc, DetailState>(
      builder: (context, state) {
        movie = state.detailEntity;
        switch (state.state) {
          case RequestState.loading:
            return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            );
          case RequestState.loaded:
            return SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //AnimateText(text: movie!.title),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child:
                            Texts.h1(string: movie!.title, context: context)),
                    Padding(
                      padding: EdgeInsets.all(8.w),
                      child: Wrap(
                        children: [
                          Row(
                            children: [
                              _showRate(movie: movie),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Text("|"),
                              ),
                              _showRelease(movie: movie),
                              SizedBox(
                                width: 16.w,
                              ),
                              RoundedContainer(
                                  radius: 10,
                                  horizontal: 10.w,
                                  vertical: 5.h,
                                  child: Texts.bodySmall(
                                      string: movie!.originalLanguage!,
                                      context: context)),
                              SizedBox(
                                width: 16.w,
                              ),
                              RoundedContainer(
                                  radius: 10,
                                  horizontal: 10.w,
                                  vertical: 5.h,
                                  child: Texts.bodySmall(
                                      string: _showTime(movie: movie),
                                      context: context)),
                              SizedBox(
                                width: 16.w,
                              ),
                              RoundedContainer(
                                  radius: 10,
                                  horizontal: 10.w,
                                  vertical: 5.h,
                                  color: Colors.yellow,
                                  child: Texts.bodySmall(
                                      string: _showRevenue(movie: movie),
                                      context: context,
                                      color: Colors.yellow)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text("Genres : ${_showGenres(movie!.genres!)}"),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(movie!.overview!),
                  ],
                ),
              ),
            );
          case RequestState.error:
            return const SliverToBoxAdapter(
              child: Center(child: Icon(Icons.error)),
            );
        }
      },
    );
  }

  String _showGenres(List<GenreEntity> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }
    if (result.isEmpty) {
      return result;
    }
    result = result.substring(0, result.length - 2);
    return result;
  }

  Text _showRelease({DetailEntity? movie}) {
    String dateString = movie!.releaseDate!;
    DateTime dateTime = DateTime.parse(dateString);
    int year = dateTime.year;
    return Text(year.toString());
  }

  String _showTime({DetailEntity? movie}) {
    int time = movie!.runtime!;
    int hours = time ~/ 60;
    int remainingMinutes = time % 60;

    return '${hours}h ${remainingMinutes}m';
  }

  Row _showRate({DetailEntity? movie}) {
    double rate = movie!.voteAverage.roundToDouble();
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/star.svg",
          color: ColorPalette.darkPrimary,
          width: 17,
        ),
        SizedBox(
          width: 8.w,
        ),
        Text(rate.toString()),
      ],
    );
  }

  String _showRevenue({DetailEntity? movie}) {
    int amount = movie!.revenue!;
    var formatter = NumberFormat.compact(
      locale: 'en_US',
    );
    String formattedAmount = formatter.format(amount);
    return formattedAmount;
  }
}
