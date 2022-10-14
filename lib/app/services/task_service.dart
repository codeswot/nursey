import 'package:nursey/app/models/task/task.dart';
import 'package:nursey/configs/configs.dart';

class TaskService {
  final FirebaseFirestore _dbInstance = FirebaseFirestore.instance;
  final _tasksCollection = 'tasks';
  String getRandomDocId() {
    return FirebaseFirestore.instance.collection('tasks').doc().id;
  }

  Stream<List<Task>>? getTasksFromShift$(String shiftId) {
    try {
      final ref = _dbInstance.collection(_tasksCollection);

      return (ref.snapshots())
          .map((event) => event.docs.map((e) => Task.fromSnapshot(e)).toList());
    } catch (e) {
      rethrow;
    }
  }

  void addNewTask(Task newTask) {
    try {
      _dbInstance
          .collection(_tasksCollection)
          .doc(newTask.id)
          .set(newTask.toJson(), SetOptions(merge: true));
    } catch (e) {
      rethrow;
    }
  }

  //TODO: had time, would have created a firestore index and querry for tasks only
  //available for current shift
  Stream<List<Task>>? getTasksFromShiftQuery$(String shiftId) {
    try {
      Query query = _dbInstance.collection(_tasksCollection);
      query = query.where('shift', isEqualTo: shiftId);
      return (query.snapshots())
          .map((event) => event.docs.map((e) => Task.fromSnapshot(e)).toList());
    } catch (e) {
      rethrow;
    }
  }
}
