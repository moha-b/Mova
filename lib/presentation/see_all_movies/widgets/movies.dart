import 'dart:math';

import 'package:flutter/material.dart';

import '../../../domain/entities/movie_entity.dart';
import 'movie_card.dart';

class AllMovies extends StatelessWidget {
  final List<MovieEntity> movieList;
  final String title;
  const AllMovies({
    super.key,
    required this.movieList,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final columns = sqrt(movieList.length).toInt();
    return SizedBox(
      width: columns * 320,
      child: Wrap(
          children: List.generate(
        movieList.length,
        (index) => Transform.translate(
          offset: Offset(0, index.isEven ? 240 : 0),
          child: MovieCard(
            movie: movieList[index],
          ),
        ),
      )),
    );
  }
}
