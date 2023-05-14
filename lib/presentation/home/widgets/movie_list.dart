import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mova/core/widgets/image_container.dart';
import 'package:mova/presentation/detail/detail_page.dart';
import 'package:mova/presentation/home/bloc/movie_bloc.dart';
import 'package:mova/presentation/see_all_movies/see_all_movies.dart';

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
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SeeAllMovies(
                                  movieList: state.topRatedMovies,
                                  title: title,
                                ),
                              ));
                        },
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
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                      movieId: state.topRatedMovies[index].id,
                                    ),
                                  ));
                            },
                            child: ImageContainer(
                                imageUrl:
                                    state.topRatedMovies[index].posterPath,
                                rate: state.topRatedMovies[index].voteAverage),
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 8.0,
                          ),
                      itemCount: state.topRatedMovies.length),
                ),
              ],
            );
          case 2:
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
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SeeAllMovies(
                                  movieList: state.upcomingMovies,
                                  title: title,
                                ),
                              ));
                        },
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
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                      movieId: state.upcomingMovies[index].id,
                                    ),
                                  ));
                            },
                            child: ImageContainer(
                                imageUrl:
                                    state.upcomingMovies[index].posterPath,
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
        return Container();
      },
    );
  }
}
