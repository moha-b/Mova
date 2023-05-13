part of 'detail_bloc.dart';

@immutable
abstract class DetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends DetailState {}

class LoadedState extends DetailState {
  final DetailEntity detailEntity;

  LoadedState({required this.detailEntity});

  LoadedState copyWith({
    DetailEntity? detailEntity,
    required RequestState state,
  }) {
    return LoadedState(detailEntity: detailEntity ?? this.detailEntity);
  }
}
