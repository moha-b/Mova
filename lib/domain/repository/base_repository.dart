import 'package:dartz/dartz.dart';
import 'package:mova/core/error/failure.dart';
import 'package:mova/domain/entities/movie_entity.dart';

abstract class BaseRepository {
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies();
}
