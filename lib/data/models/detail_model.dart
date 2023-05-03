import 'package:mova/data/models/genre_model.dart';
import 'package:mova/data/models/production_company_model.dart';

import '../../domain/entities/detail_entity.dart';

class DetailModel extends DetailEntity {
  factory DetailModel.fromJson(Map<String, dynamic> json) {
    return DetailModel(
      backdropPath: json['backdrop_path']!,
      genres: (json['genres'] as List<dynamic>)
          .map((genre) => GenreModel.fromJson(genre))
          .toList(),
      id: json['id'],
      originalLanguage: json['original_language'],
      overview: json['overview'],
      popularity: json['popularity'].toDouble(),
      posterPath: json['poster_path'],
      productionCompanies: (json['production_companies'] as List<dynamic>)
          .map((company) => ProductionCompanyModel.fromJson(company))
          .toList(),
      releaseDate: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'].toDouble(),
    );
  }

  const DetailModel({
    required String? backdropPath,
    required List<GenreModel> genres,
    required int id,
    required String? originalLanguage,
    required String? overview,
    required double popularity,
    required String? posterPath,
    required List<ProductionCompanyModel> productionCompanies,
    required String? releaseDate,
    required int? revenue,
    required int? runtime,
    required String title,
    required bool video,
    required double voteAverage,
  }) : super(
          backdropPath: backdropPath,
          genres: genres,
          id: id,
          originalLanguage: originalLanguage,
          overview: overview,
          popularity: popularity,
          posterPath: posterPath,
          productionCompanies: productionCompanies,
          releaseDate: releaseDate,
          revenue: revenue,
          runtime: runtime,
          title: title,
          video: video,
          voteAverage: voteAverage,
        );
}
