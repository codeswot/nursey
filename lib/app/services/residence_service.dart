import 'package:nursey/app/models/residence/residence.dart';
import 'package:nursey/configs/configs.dart';

class ResidenceService {
  final FirebaseFirestore _dbInstance = FirebaseFirestore.instance;
  final _residenceCollection = 'residence';
  Future<List<Residence>?> getAllResidence() async {
    try {
      final residenceRef =
          await _dbInstance.collection(_residenceCollection).get();
      return residenceRef.docs.map((e) => Residence.fromSnapshot(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
