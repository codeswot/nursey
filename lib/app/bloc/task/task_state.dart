part of 'task_bloc.dart';

enum TaskBlocStatus { initial, success, error, loading }

extension TaskStatusX on TaskBlocStatus {
  bool get isInitial => this == TaskBlocStatus.initial;
  bool get isLoading => this == TaskBlocStatus.loading;
  bool get isSuccess => this == TaskBlocStatus.success;
  bool get isError => this == TaskBlocStatus.error;
}

class TaskState extends Equatable {
  const TaskState({
    this.status = TaskBlocStatus.initial,
    this.tasks,
    this.exception,
  });
  final TaskBlocStatus status;
  final Stream<List<Task>?>? tasks;
  final String? exception;

  TaskState copyWith({
    Stream<List<Task>?>? tasks,
    TaskBlocStatus? status,
    String? exception,
  }) {
    return TaskState(
      tasks: tasks ?? this.tasks,
      status: status ?? this.status,
      exception: exception ?? this.exception,
    );
  }

  @override
  List<Object?> get props => [tasks, exception, status];
}
