import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mova/core/widgets/image_container.dart';
import 'package:mova/domain/entities/movie_entity.dart';
import 'package:mova/presentation/detail/detail_page.dart';
import 'package:mova/presentation/home/bloc/movie_bloc.dart';
import 'package:mova/presentation/see_all_movies/see_all.dart';

class MovieListWidget extends StatelessWidget {
  final int type;
  final String title;
  const MovieListWidget({
    super.key,
    required this.type,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        switch (type) {
          case 1:
            return buildMovieList(context, state);
          case 2:
            return buildMovieList(context, state);
        }
        return Container();
      },
    );
  }

  Column buildMovieList(BuildContext context, MovieState state) {
    return Column(
      children: [
        const SizedBox(
          height: 8.0,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              InkWell(
                onTap: () => _goToSeeAll(
                    context: context,
                    movieList: state.upcomingMovies,
                    title: title),
                child: Text(
                  "See all",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 210.0,
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
              padding: const EdgeInsets.only(left: 16.0),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () =>
                        _goToDetailPage(context, state.upcomingMovies, index),
                    child: ImageContainer(
                        imageUrl: state.upcomingMovies[index].posterPath,
                        rate: state.upcomingMovies[index].voteAverage),
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    width: 8.0,
                  ),
              itemCount: state.upcomingMovies.length),
        ),
      ],
    );
  }

  void _goToDetailPage(
      BuildContext context, List<MovieEntity> movieList, int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(
            movieId: movieList[index].id,
          ),
        ));
  }
}

void _goToSeeAll({
  required BuildContext context,
  required List<MovieEntity> movieList,
  required String title,
}) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TestSee(
          movieList: movieList,
          title: title,
        ),
      ));
}
