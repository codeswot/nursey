import 'dart:async';

import 'package:nursey/app/models/task/task.dart';
import 'package:nursey/app/repository/task_repository.dart';
import 'package:nursey/configs/configs.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository _repository;
  TaskBloc(this._repository) : super(const TaskState()) {
    on<GetTasks>(_onGetTasks);
    on<AddTask>(_onAddTask);
  }
  void _onGetTasks(GetTasks events, Emitter<TaskState> emit) {
    try {
      emit(state.copyWith(status: TaskStatus.loading));
      final taskStream = _repository.getTasksFromShift$(events.shiftId);
      emit(state.copyWith(tasks: taskStream, status: TaskStatus.success));
    } catch (e) {
      emit(state.copyWith(exception: e.toString(), status: TaskStatus.error));
    }
  }

  void _onAddTask(AddTask events, Emitter<TaskState> emit) {
    try {
      emit(state.copyWith(status: TaskStatus.loading));
      _repository.addTask(events.task);
      emit(state.copyWith(status: TaskStatus.success));
    } catch (e) {
      emit(state.copyWith(exception: e.toString(), status: TaskStatus.error));
    }
  }
}
