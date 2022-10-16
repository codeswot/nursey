part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();
  @override
  List<Object?> get props => [];
}

class GetTasks extends TaskEvent {
  const GetTasks({required this.shiftId});

  final String shiftId;
  @override
  List<Object> get props => [shiftId];
}

class SetTask extends TaskEvent {
  const SetTask({required this.task});

  final Task task;
  @override
  List<Object> get props => [task];
}
