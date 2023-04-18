import 'package:dartz/dartz.dart';
import 'package:mova/core/error/failure.dart';
import 'package:mova/domain/entities/movie_entity.dart';
import 'package:mova/domain/repository/base_repository.dart';

class GetNowPlyingUseCase {
  BaseRepository baseRepository;

  GetNowPlyingUseCase(this.baseRepository);
  Future<Either<Failure, List<MovieEntity>>> execute() async {
    return await baseRepository.getNowPlayingMovies();
  }
}
