import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mova/domain/usecase/get_top_rated_usecase.dart';
import 'package:mova/domain/usecase/get_upcoming_usecase.dart';
import 'package:mova/domain/usecase/now_playing_usecase.dart';

import '../../../core/util/enums.dart';
import '../../../domain/entities/movie_entity.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlyingUseCase getNowPlayingMoviesUseCase;
  final GetUpcomingUseCase getPopularMoviesUseCase;
  final GetTopRatedUseCase getTopRatedMoviesUseCase;

  MovieBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MovieState()) {
    on<GetNowPlayingEvent>(_getNowPlayingMovies);
    on<GetTopRatedEvent>(_getTopRatedMovies);
    on<GetUpcomingEvent>(_getPopularMovies);
  }

  Future<void> _getNowPlayingMovies(
      GetNowPlayingEvent event, Emitter<MovieState> emit) async {
    final result = await getNowPlayingMoviesUseCase.execute();
    result.fold(
      (l) => emit(state.copyWith(
        nowPlayingState: RequestState.error,
        upcomingMessage: l.errorMessage,
      )),
      (r) => emit(
        state.copyWith(
          nowPlayingMovies: r,
          nowPlayingState: RequestState.loaded,
        ),
      ),
    );
  }

  Future<void> _getPopularMovies(
      GetUpcomingEvent event, Emitter<MovieState> emit) async {
    final result = await getPopularMoviesUseCase.execute();

    result.fold(
      (l) => emit(
        state.copyWith(
          upcomingState: RequestState.error,
          upcomingMessage: l.errorMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          upcomingMovies: r,
          upcomingState: RequestState.loaded,
        ),
      ),
    );
  }

  Future<void> _getTopRatedMovies(
      GetTopRatedEvent event, Emitter<MovieState> emit) async {
    final result = await getTopRatedMoviesUseCase.execute();

    result.fold(
      (l) => emit(state.copyWith(
        topRatedMessage: l.errorMessage,
        topRatedState: RequestState.error,
      )),
      (r) => emit(
        state.copyWith(
          topRatedMovies: r,
          topRatedState: RequestState.loaded,
        ),
      ),
    );
  }
}
