import 'package:nursey/app/models/task/task.dart';
import 'package:nursey/app/services/task_service.dart';

class TaskRepository {
  const TaskRepository(this._service);
  final TaskService _service;

  Stream<List<Task>>? getTasksFromShift$(String shiftId) =>
      _service.getTasksFromShift$(shiftId);

  void addTask(Task newTask) => _service.addNewTask(newTask);
}
