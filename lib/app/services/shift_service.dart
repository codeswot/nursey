import 'package:nursey/configs/configs.dart';

import '../models/models.dart';

class ShiftService {
  final FirebaseFirestore _dbInstance = FirebaseFirestore.instance;
  final _shiftsCollection = 'shifts';
  Future<Shift?> getShiftFromId(String shiftId) async {
    try {
      final shiftSnap =
          await _dbInstance.collection(_shiftsCollection).doc(shiftId).get();
      return Shift.fromSnapshot(shiftSnap);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Shift>> getAllShifts() async {
    try {
      final shiftSnap = await _dbInstance.collection(_shiftsCollection).get();

      return shiftSnap.docs.map((e) => Shift.fromSnapshot(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
