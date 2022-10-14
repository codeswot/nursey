import 'package:nursey/app/models/nurse/nurse.dart';
import 'package:nursey/app/repository/nurse_repository.dart';
import 'package:nursey/configs/configs.dart';

part 'nurse_event.dart';
part 'nurse_state.dart';

class NurseBloc extends Bloc<NurseEvent, NurseState> {
  final NurseRepository _repository;

  NurseBloc(this._repository) : super(const NurseState()) {
    on<GetNurse>(_onNurseGet);
    on<SetNurse>(_onNurseSet);
  }

  Future<void> _onNurseGet(GetNurse events, Emitter<NurseState> emit) async {
    try {
      emit(state.copyWith(status: NurseStatus.loading));
      final nurse = await _repository.getNurse(events.id);
      emit(state.copyWith(status: NurseStatus.success, nurse: nurse));
    } catch (e) {
      emit(state.copyWith(status: NurseStatus.error, exception: e.toString()));
    }
  }

  Future<void> _onNurseSet(SetNurse events, Emitter<NurseState> emit) async {
    try {
      emit(state.copyWith(status: NurseStatus.loading));
      await _repository.setNurse(events.nurse);

      emit(state.copyWith(status: NurseStatus.success, nurse: events.nurse));
    } catch (e) {
      emit(state.copyWith(status: NurseStatus.error, exception: e.toString()));
    }
  }
}
