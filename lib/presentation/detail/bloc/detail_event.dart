part of 'detail_bloc.dart';

@immutable
abstract class DetailEvent extends Equatable {}

class GetDetailEvent extends DetailEvent {
  final int movieId;
  GetDetailEvent({required this.movieId});

  @override
  List<Object> get props => [];
}
