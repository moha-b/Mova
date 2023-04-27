import 'package:dio/dio.dart';
import 'package:mova/core/error/failure.dart';
import 'package:mova/core/util/constance.dart';
import 'package:mova/data/models/detail_model.dart';
import 'package:mova/data/models/movie_model.dart';

abstract class DataSourceRepository {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<List<MovieModel>> getUpcomingMovies();
  Future<DetailModel> getDetail(int movieId);
  Future<DetailModel> getTest(int movieId);
}

class MovieRemoteDataSource extends DataSourceRepository {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    try {
      // Make HTTP GET request to fetch movie data
      final response = await Dio().get(Network.NOW_PLAYING_URL);

      // Check if response is successful
      if (response.statusCode == 200) {
        // Parse JSON response into a list of MovieModel objects
        final List<MovieModel> movies = List<MovieModel>.from(
            response.data['results'].map((json) => MovieModel.fromJson(json)));
        return movies;
      } else {
        print(
            "MovieRemoteDataSource file : getNowPlayingMovies method :: Else");
        throw ServerFailure(
            'Failed to fetch movies: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      // Handle DioError and map to Failure class
      throw ServerFailure.fromDioError(e);
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    try {
      // Make HTTP GET request to fetch movie data
      final response = await Dio().get(Network.TOP_RATED_URL);

      // Check if response is successful
      if (response.statusCode == 200) {
        // Parse JSON response into a list of MovieModel objects
        final List<MovieModel> movies = List<MovieModel>.from(
            response.data['results'].map((json) => MovieModel.fromJson(json)));
        return movies;
      } else {
        print(
            "MovieRemoteDataSource file : getNowPlayingMovies method :: Else");
        throw ServerFailure(
            'Failed to fetch movies: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      // Handle DioError and map to Failure class
      throw ServerFailure.fromDioError(e);
    }
  }

  @override
  Future<List<MovieModel>> getUpcomingMovies() async {
    try {
      // Make HTTP GET request to fetch movie data
      final response = await Dio().get(Network.UPCOMING_URL);

      // Check if response is successful
      if (response.statusCode == 200) {
        // Parse JSON response into a list of MovieModel objects
        final List<MovieModel> movies = List<MovieModel>.from(
            response.data['results'].map((json) => MovieModel.fromJson(json)));
        return movies;
      } else {
        print(
            "MovieRemoteDataSource file : getNowPlayingMovies method :: Else");
        throw ServerFailure(
            'Failed to fetch movies: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }

  @override
  Future<DetailModel> getDetail(int movieId) async {
    final response = await Dio().get(Network.detailUrl(movieId));

    try {
      if (response.statusCode == 200) {
        final data = response.data;
        return DetailModel.fromJson(data);
      } else {
        throw ServerFailure(
            'Failed to fetch movies: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }

  @override
  Future<DetailModel> getTest(int movieId) async {
    final response = await Dio().get(Network.testUrl());
    try {
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        return DetailModel.fromJson(data);
      } else {
        throw ServerFailure(
            'Failed to fetch movies: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }
}
