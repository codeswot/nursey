import 'package:nursey/app/models/nurse/nurse.dart';
import 'package:nursey/app/services/nurse_service.dart';

class NurseRepository {
  const NurseRepository(this._service);
  final NurseService _service;

  Future<Nurse?> getNurse(String nurseId) async =>
      _service.getNurseProfile(nurseId);

  Future<void> setNurse(Nurse nurse) async =>
      _service.createNurseProfile(nurse);
}
