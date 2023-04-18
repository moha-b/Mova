import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/movie_entity.dart';
import '../../domain/usecase/now_playing_usecase.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  GetNowPlyingUseCase getNowPlayingUseCase;
  MovieBloc({required this.getNowPlayingUseCase}) : super(MovieInitial()) {
    on<GetNowPlayingEvent>((event, emit) async {
      emit(MovieLoading());
      try {
        final result = await getNowPlayingUseCase.execute();
        result.fold(
            (failure) => emit(MovieError(message: failure.errorMessage)),
            (movies) => emit(MovieLoaded(moviesList: movies)));
      } catch (e) {
        emit(MovieError(message: e.toString()));
      }
    });
  }
}
