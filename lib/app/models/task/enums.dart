enum TaskStatus { draft, pending, completed }

extension TaskStatusX on TaskStatus {
  bool get isDraft => this == TaskStatus.draft;
  bool get isPending => this == TaskStatus.pending;
  bool get isCompleted => this == TaskStatus.completed;
}

enum TaskSeverity { mild, casual, important }

extension TaskSeverityX on TaskSeverity {
  bool get isMild => this == TaskSeverity.mild;
  bool get isCasual => this == TaskSeverity.casual;
  bool get isImportant => this == TaskSeverity.important;
}
