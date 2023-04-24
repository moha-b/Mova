part of 'detail_bloc.dart';

@immutable
class DetailState extends Equatable {
  final DetailEntity? detailEntity;
  final RequestState state;
  const DetailState({required this.state, this.detailEntity});

  DetailState copyWith({
    DetailEntity? detailEntity,
    required RequestState state,
  }) {
    return DetailState(
        detailEntity: detailEntity ?? this.detailEntity, state: state);
  }

  @override
  List<Object?> get props => [detailEntity];
}
