import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mova/presentation/detail/detail_page.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/util/constance.dart';
import '../../../core/util/enums.dart';
import '../bloc/movie_bloc.dart';

class NowPlayingComponent extends StatelessWidget {
  const NowPlayingComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        switch (state.nowPlayingState) {
          case RequestState.loading:
            return Center(
              child: CircularProgressIndicator(),
            );
          case RequestState.loaded:
            final movie = state.nowPlayingMovies;
            return CarouselSlider.builder(
              itemCount: movie.length,
              itemBuilder: (context, index, realIndex) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailPage(movieId: movie[index].id),
                        ));
                  },
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        width: MediaQuery.of(context).size.width,
                        imageUrl: Network.imageUrl(movie[index].backdropPath),
                        fit: BoxFit.cover,
                        height: 300.h,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            color: Colors.transparent,
                          ),
                        ),
                        errorWidget: (context, url, error) => Center(
                          child: Icon(Icons.error),
                        ),
                      ),
                      Positioned(
                        bottom: 10.h,
                        left: 16.w,
                        child: Column(
                          children: [
                            Text(
                              movie[index].title,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(color: Colors.white),
                            ),
                            Text(movie[index].genreIds.toString()),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              options: CarouselOptions(
                  height: 300.h,
                  viewportFraction: 1,
                  autoPlay: true,
                  animateToClosest: true),
            );
          case RequestState.error:
            return Center(
              child: Text("Error"),
            );
        }
      },
    );
  }
}
