import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mova/core/util/enums.dart';
import 'package:mova/domain/entities/detail_entity.dart';

import '../../../domain/usecase/get_details_usecase.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  GetDetailsUseCase getDetailsUseCase;

  DetailBloc(this.getDetailsUseCase)
      : super(const DetailState(state: RequestState.loading)) {
    on<GetDetailEvent>((event, emit) async {
      final result = await getDetailsUseCase.execute(event.movieId);
      result.fold(
          (failure) => emit(state.copyWith(state: RequestState.error)),
          (details) => emit(state.copyWith(
              detailEntity: details, state: RequestState.loaded)));
    });
  }
}
