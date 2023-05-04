import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/util/enums.dart';
import '../../../core/widgets/movie_list.dart';
import '../../../core/widgets/title_section.dart';
import '../bloc/movie_bloc.dart';

class TopRatedComponent extends StatelessWidget {
  const TopRatedComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
      switch (state.topRatedState) {
        case RequestState.loading:
          return Center(
            child: CircularProgressIndicator(),
          );
        case RequestState.loaded:
          return Column(
            children: [
              TitleSection(
                  title: "Top Rated", seeAllList: state.topRatedMovies),
              MovieList(list: state.topRatedMovies),
            ],
          );
        case RequestState.error:
          return Center(
            child: Text("Error"),
          );
      }
    });
  }
}
