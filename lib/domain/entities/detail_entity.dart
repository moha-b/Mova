import 'package:equatable/equatable.dart';
import 'package:mova/domain/entities/production_company_entity.dart';

import 'genre_entity.dart';

class DetailEntity extends Equatable {
  final String? backdropPath;
  final List<GenreEntity> genres;
  final int id;
  final String? originalLanguage;
  final String? overview;
  final double popularity;
  final String? posterPath;
  final List<ProductionCompanyEntity> productionCompanies;
  final String? releaseDate;
  final int? revenue;
  final int? runtime;
  final String title;
  final bool video;
  final double voteAverage;

  @override
  List<Object?> get props => [
        backdropPath,
        genres,
        id,
        originalLanguage,
        overview,
        popularity,
        posterPath,
        productionCompanies,
        releaseDate,
        revenue,
        runtime,
        title,
        video,
        voteAverage,
      ];

  const DetailEntity({
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.originalLanguage,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.title,
    required this.video,
    required this.voteAverage,
  });
}
