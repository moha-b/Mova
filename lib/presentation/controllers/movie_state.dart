part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  @override
  List<Object?> get props => [];

  const MovieState();
}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final List<MovieEntity> moviesList;

  const MovieLoaded({required this.moviesList});

  @override
  List<Object?> get props => [moviesList];
}

class MovieError extends MovieState {
  final String message;

  const MovieError({required this.message});

  @override
  List<Object?> get props => [message];
}
