import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mova/core/widgets/grid_view.dart';
import 'package:mova/domain/entities/movie_entity.dart';

class SeeAllMovies extends StatelessWidget {
  final List<MovieEntity> movieList;
  final String title;
  const SeeAllMovies({Key? key, required this.movieList, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Iconsax.arrow_left_2),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearch(movieList));
              },
              icon: const Icon(Iconsax.search_normal))
        ],
      ),
      body: buildMovieGrid(movie: movieList),
    );
  }
}

class CustomSearch extends SearchDelegate {
  List<MovieEntity> list;

  CustomSearch(this.list);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(
            Iconsax.close_circle,
            color: Colors.white,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Iconsax.arrow_left_2, color: Colors.white));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<MovieEntity> matching = [];
    for (var movie in list) {
      if (movie.title.toLowerCase().contains(query.toLowerCase())) {
        matching.add(movie);
      }
    }
    return buildMovieGrid(movie: matching);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<MovieEntity> matching = [];
    for (var movie in list) {
      if (movie.title.toLowerCase().contains(query.toLowerCase())) {
        matching.add(movie);
      }
    }
    return buildMovieGrid(movie: matching);
  }
}
