import 'package:mova/data/models/cast_model.dart';
import 'package:mova/data/models/crew_model.dart';
import 'package:mova/data/models/genre_model.dart';
import 'package:mova/data/models/production_company_model.dart';

import '../../domain/entities/detail_entity.dart';
import 'movie_model.dart';

class DetailModel extends DetailEntity {
  factory DetailModel.fromJson(
    Map<String, dynamic> json,
    List<dynamic> castData,
    List<dynamic> crewData,
    List<MovieModel> recommendationData,
  ) {
    return DetailModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      budget: json['budget'],
      genres: GenreModel.from(json['genres']),
      homepage: json['homepage'],
      id: json['id'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      productionCompanies:
          ProductionCompanyModel.from(json['production_companies']),
      productionCountries:
          List<Map<String, dynamic>>.from(json['production_countries']),
      releaseDate: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      cast: CastModel.from(castData),
      crew: CrewModel.from(crewData),
      recommendation: recommendationData,
    );
  }

  const DetailModel(
      {required bool adult,
      required String backdropPath,
      required int budget,
      required List<GenreModel> genres,
      required String homepage,
      required int id,
      required String originalTitle,
      required String overview,
      required double popularity,
      required String posterPath,
      required List<ProductionCompanyModel> productionCompanies,
      required List<Map<String, dynamic>> productionCountries,
      required String releaseDate,
      required int revenue,
      required int runtime,
      required String title,
      required bool video,
      required double voteAverage,
      required List<CastModel> cast,
      required List<CrewModel> crew,
      required List<MovieModel> recommendation})
      : super(
            adult: adult,
            backdropPath: backdropPath,
            budget: budget,
            genres: genres,
            homepage: homepage,
            id: id,
            originalTitle: originalTitle,
            overview: overview,
            popularity: popularity,
            posterPath: posterPath,
            productionCompanies: productionCompanies,
            productionCountries: productionCountries,
            releaseDate: releaseDate,
            revenue: revenue,
            runtime: runtime,
            title: title,
            video: video,
            voteAverage: voteAverage,
            cast: cast,
            crew: crew,
            recommendation: recommendation);
}
