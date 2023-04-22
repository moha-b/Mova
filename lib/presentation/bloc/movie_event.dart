part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class GetNowPlayingEvent extends MovieEvent {}

class GetTopRatedEvent extends MovieEvent {}

class GetUpcomingEvent extends MovieEvent {}
