import 'package:nursey/configs/configs.dart';

import '../models/models.dart';

class NurseService {
  final FirebaseFirestore _dbInstance = FirebaseFirestore.instance;
  final _nursesCollection = 'nurses';
  Future<void> createNurseProfile(Nurse nurse) async {
    try {
      await _dbInstance
          .collection(_nursesCollection)
          .doc(nurse.id)
          .set(nurse.toJson(), SetOptions(merge: true));
    } catch (e) {
      rethrow;
    }
  }

  Future<Nurse> getNurseProfile(String nurseId) async {
    try {
      final res =
          await _dbInstance.collection(_nursesCollection).doc(nurseId).get();
      return Nurse.fromSnapshot(res);
    } catch (e) {
      rethrow;
    }
  }

  //TODO: Update nurse info e.g (shift,name)
  void updateNurseProfile(String nurseId) {}
}
