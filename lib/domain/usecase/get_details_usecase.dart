import 'package:dartz/dartz.dart';
import 'package:mova/core/error/failure.dart';
import 'package:mova/domain/entities/detail_entity.dart';
import 'package:mova/domain/repository/base_repository.dart';

class GetDetailsUseCase {
  BaseRepository baseRepository;

  GetDetailsUseCase(this.baseRepository);

  Future<Either<Failure, DetailEntity>> execute(int movieId) {
    return baseRepository.getDetails(movieId);
  }
}

class GetTest {
  BaseRepository baseRepository;

  GetTest(this.baseRepository);
  Future<Either<Failure, DetailEntity>> execute(int movieId) {
    return baseRepository.getTest();
  }
}
