import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String title;
  final String releaseDate;
  final String overview;
  final String posterPath;
  final double popularity;
  final double voteAverage;
  final int voteCount;

  const MovieEntity({
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.overview,
    required this.posterPath,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  List<Object?> get props => [
        backdropPath,
        genreIds,
        id,
        title,
        releaseDate,
        overview,
        posterPath,
        popularity,
        voteAverage,
        voteCount,
      ];
}
