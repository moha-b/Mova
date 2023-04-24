import 'package:dartz/dartz.dart';
import 'package:mova/core/error/failure.dart';
import 'package:mova/domain/entities/detail_entity.dart';
import 'package:mova/domain/entities/movie_entity.dart';

abstract class BaseRepository {
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies();
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies();
  Future<Either<Failure, List<MovieEntity>>> getUpcomingMovies();
  Future<Either<Failure, DetailEntity>> getDetails(int movieId);
  Future<Either<Failure, DetailEntity>> getTest();
}
