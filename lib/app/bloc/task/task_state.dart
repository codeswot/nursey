part of 'task_bloc.dart';

enum TaskStatus { initial, success, error, loading }

extension TaskStatusX on TaskStatus {
  bool get isInitial => this == TaskStatus.initial;
  bool get isLoading => this == TaskStatus.loading;
  bool get isSuccess => this == TaskStatus.success;
  bool get isError => this == TaskStatus.error;
}

class TaskState extends Equatable {
  const TaskState({
    this.status = TaskStatus.initial,
    this.tasks,
    this.exception,
  });
  final TaskStatus status;
  final Stream<List<Task>?>? tasks;
  final String? exception;

  TaskState copyWith({
    Stream<List<Task>?>? tasks,
    TaskStatus? status,
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
