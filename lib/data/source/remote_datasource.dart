import 'package:dio/dio.dart';
import 'package:mova/core/error/failure.dart';
import 'package:mova/core/util/constance.dart';
import 'package:mova/data/models/movie_model.dart';

abstract class DataSourceRepository {
  Future<List<MovieModel>> getNowPlayingMovies();
}

class MovieRemoteDataSource extends DataSourceRepository {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    try {
      // Make HTTP GET request to fetch movie data
      final response = await Dio().get(Api.NOW_PLAYING_URL);

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
}
