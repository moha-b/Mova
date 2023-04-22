import 'package:get_it/get_it.dart';
import 'package:mova/data/repository/base_repository_impl.dart';
import 'package:mova/data/source/remote_datasource.dart';
import 'package:mova/domain/repository/base_repository.dart';
import 'package:mova/domain/usecase/get_top_rated_usecase.dart';
import 'package:mova/domain/usecase/get_upcoming_usecase.dart';
import 'package:mova/domain/usecase/now_playing_usecase.dart';

import '../../presentation/bloc/movie_bloc.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  void init() {
    getIt.registerLazySingleton<DataSourceRepository>(
        () => MovieRemoteDataSource());

    getIt.registerLazySingleton<BaseRepository>(
        () => BaseRepositoryImpl(getIt()));

    getIt.registerLazySingleton(() => GetNowPlyingUseCase(getIt()));
    getIt.registerLazySingleton(() => GetTopRatedUseCase(getIt()));
    getIt.registerLazySingleton(() => GetUpcomingUseCase(getIt()));

    // Bloc
    getIt.registerFactory(() => MovieBloc(getIt(), getIt(), getIt()));
  }
}
