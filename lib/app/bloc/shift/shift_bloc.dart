import 'package:nursey/app/models/shift/shift.dart';
import 'package:nursey/app/repository/repository.dart';
import 'package:nursey/configs/configs.dart';

part 'shift_event.dart';
part 'shift_state.dart';

class ShiftBloc extends Bloc<ShiftEvent, ShiftState> {
  final ShiftRepository _repository;

  ShiftBloc(this._repository) : super(const ShiftState()) {
    on<GetShift>(_onGetShift);
  }

  Future<void> _onGetShift(GetShift events, Emitter<ShiftState> emit) async {
    try {
      emit(state.copyWith(status: ShiftStatus.loading));
      final shift = await _repository.getShiftFromId(events.id);
      emit(state.copyWith(status: ShiftStatus.success, shift: shift));
    } catch (e) {
      emit(state.copyWith(exception: e.toString(), status: ShiftStatus.error));
    }
  }
}
