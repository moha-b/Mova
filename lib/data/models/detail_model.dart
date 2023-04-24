import 'package:mova/data/models/genre_model.dart';
import 'package:mova/data/models/production_company_model.dart';

import '../../domain/entities/detail_entity.dart';

class DetailModel extends DetailEntity {
  factory DetailModel.fromJson(Map<String, dynamic> json) {
    return DetailModel(
      backdropPath: json['backdrop_path']!,
      genres: json['genres'] != null
          ? List<GenreModel>.from(
              json['genres'].map((genre) => GenreModel.fromJson(genre)))
          : null,
      id: json['id'],
      originalLanguage: json['original_language'],
      overview: json['overview'],
      popularity: json['popularity'].toDouble(),
      posterPath: json['poster_path'],
      productionCompanies: json['production_companies'] != null
          ? List<ProductionCompanyModel>.from(json['production_companies']
              .map((company) => ProductionCompanyModel.fromJson(company)))
          : null,
      releaseDate: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'].toDouble(),
    );
  }
  const DetailModel(
      {required super.backdropPath,
      required super.genres,
      required super.id,
      required super.originalLanguage,
      required super.overview,
      required super.popularity,
      required super.posterPath,
      required super.productionCompanies,
      required super.releaseDate,
      required super.revenue,
      required super.runtime,
      required super.title,
      required super.video,
      required super.voteAverage});
}
