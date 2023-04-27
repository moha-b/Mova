import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/util/enums.dart';
import '../../../core/widgets/movie_list.dart';
import '../bloc/movie_bloc.dart';

class UpcomingComponent extends StatelessWidget {
  const UpcomingComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
      switch (state.upcomingState) {
        case RequestState.loading:
          return const Center(
            child: CircularProgressIndicator(),
          );
        case RequestState.loaded:
          return MovieList(list: state.upcomingMovies);
        case RequestState.error:
          return const Center(
            child: Text("Error"),
          );
      }
    });
  }
}
