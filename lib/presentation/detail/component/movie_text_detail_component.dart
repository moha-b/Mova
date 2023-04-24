import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
            return SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            );
          case RequestState.loaded:
            return SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Texts.h1(string: movie!.title, color: Colors.black),
                        _showRate(movie: movie),
                      ],
                    ),
                    Container(
                        height: 50.h, child: _movieGenres(movie!.genres!)),
                    Text(movie!.overview!),
                  ],
                ),
              ),
            );
          case RequestState.error:
            return SliverToBoxAdapter(
              child: Center(child: Icon(Icons.error)),
            );
        }
      },
    );
  }

  Widget _movieGenres(List<GenreEntity> genres) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return ChoiceChip(
          label: Text(genres[index].name.toString()),
          selected: false,
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(width: 5.w),
      itemCount: genres.length,
    );
  }

  Row _showRate({DetailEntity? movie}) {
    return Row(
      children: [
        Text(movie!.voteAverage.toString() ?? "unrated"),
        SizedBox(
          width: 5.w,
        ),
        SvgPicture.asset(
          "assets/icons/star.svg",
          color: Colors.yellow[700],
          width: 17,
        ),
      ],
    );
  }
}
