import 'package:mova/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required String backdropPath,
    required List<int> genreIds,
    required int id,
    required String title,
    required String releaseDate,
    required String overview,
    required String posterPath,
    required double popularity,
    required double voteAverage,
    required int voteCount,
  }) : super(
          backdropPath: backdropPath,
          genreIds: genreIds,
          id: id,
          title: title,
          releaseDate: releaseDate,
          overview: overview,
          posterPath: posterPath,
          popularity: popularity,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      backdropPath: json['backdrop_path'],
      genreIds: List<int>.from(json['genre_ids']),
      id: json['id'],
      title: json['title'],
      releaseDate: json['release_date'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      popularity: json['popularity'].toDouble(),
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'],
    );
  }
}
