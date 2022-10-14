import 'package:nursey/app/models/models.dart';
import 'package:nursey/app/services/shift_service.dart';

class ShiftRepository {
  const ShiftRepository(this._service);
  final ShiftService _service;

  Future<Shift?> getShiftFromId(String shiftId) async =>
      _service.getShiftFromId(shiftId);
}
