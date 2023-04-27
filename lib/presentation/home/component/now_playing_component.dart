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
                            builder: (context) => DetailPage(
                                movieId: state.nowPlayingMovies[index].id),
                          ));
                    },
                    child: CachedNetworkImage(
                      width: MediaQuery.of(context).size.width,
                      imageUrl: Network.imageUrl(movie[index].posterPath),
                      fit: BoxFit.cover,
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
                  );
                },
                options: CarouselOptions(height: 500.h, viewportFraction: 1));
          case RequestState.error:
            return Center(
              child: Text("Error"),
            );
        }
      },
    );
  }
}
