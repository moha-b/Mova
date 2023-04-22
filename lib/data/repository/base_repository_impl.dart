import 'package:dartz/dartz.dart';
import 'package:mova/core/error/failure.dart';
import 'package:mova/data/source/remote_datasource.dart';
import 'package:mova/domain/entities/movie_entity.dart';
import 'package:mova/domain/repository/base_repository.dart';

class BaseRepositoryImpl extends BaseRepository {
  DataSourceRepository dataSourceRepository;

  BaseRepositoryImpl(this.dataSourceRepository);

  @override
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies() async {
    final result = await dataSourceRepository.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerFailure catch (failure) {
      return left(failure);
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies() async {
    final result = await dataSourceRepository.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerFailure catch (failure) {
      return left(failure);
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getUpcomingMovies() async {
    final result = await dataSourceRepository.getUpcomingMovies();
    try {
      return Right(result);
    } on ServerFailure catch (failure) {
      return left(failure);
    }
  }
}
