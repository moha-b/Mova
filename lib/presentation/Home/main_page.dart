import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mova/core/services/service_locator.dart';
import 'package:mova/core/util/constance.dart';
import 'package:mova/core/widgets/movie_list.dart';
import 'package:mova/core/widgets/title_section.dart';
import 'package:mova/domain/entities/movie_entity.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/util/enums.dart';
import '../bloc/movie_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build Page");
    return BlocProvider(
      create: (context) => getIt<MovieBloc>()
        ..add(GetNowPlayingEvent())
        ..add(GetTopRatedEvent())
        ..add(GetUpcomingEvent()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
                switch (state.nowPlayingState) {
                  case RequestState.loading:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  case RequestState.loaded:
                    return Column(
                      children: [
                        SearchSection(
                          list: state.nowPlayingMovies,
                        ),
                      ],
                    );
                  case RequestState.error:
                    return Center(
                      child: Text("Error"),
                    );
                }
              }),
              const TitleSection(title: "Top Rated", isLoading: true),
              BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
                switch (state.topRatedState) {
                  case RequestState.loading:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  case RequestState.loaded:
                    return MovieList(list: state.topRatedMovies);
                  case RequestState.error:
                    return Center(
                      child: Text("Error"),
                    );
                }
              }),
              const TitleSection(title: "Upcoming", isLoading: true),
              BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
                switch (state.upcomingState) {
                  case RequestState.loading:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  case RequestState.loaded:
                    return MovieList(list: state.upcomingMovies);
                  case RequestState.error:
                    return Center(
                      child: Text("Error"),
                    );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchSection extends StatelessWidget {
  final List<MovieEntity> list;
  const SearchSection({
    required this.list,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 40.h),
        padding: EdgeInsets.all(16.w),
        child: SizedBox(
            width: double.infinity,
            height: 200.h,
            child: PageView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: CachedNetworkImage(
                        imageUrl: Api.imageUrl(list[index].backdropPath),
                        fit: BoxFit.contain,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                        errorWidget: (context, url, error) => Center(
                          child: Icon(Icons.error),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 16.h,
                      left: 16.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Texts.h2(
                              string: list[index].title, color: Colors.white),
                          Texts.h2(
                              string: list[index].popularity.toString(),
                              color: Colors.white),
                        ],
                      ),
                    )
                  ],
                );
              },
            )));
  }
}
