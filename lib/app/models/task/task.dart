import 'package:nursey/app/services/services.dart';
import 'package:nursey/app/utils/serialisable.dart';
import 'package:nursey/configs/configs.dart';

import 'enums.dart';

part 'task.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class Task {
  Task({
    String? id,
    required this.task,
    required this.shift,
    required this.residence,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.note,
    this.status = TaskStatus.pending,
    this.severity = TaskSeverity.mild,
  }) {
    this.createdAt = createdAt ?? DateTime.now();
    this.updatedAt = updatedAt ?? DateTime.now();
    this.id = id ?? TaskService().getRandomDocId();
  }

  @JsonKey(readValue: Serialization.readStringValue)
  String? id;
  @JsonKey(readValue: Serialization.readStringValue)
  final String task;

  @JsonKey(readValue: Serialization.readStringValue)
  final String shift;
  @JsonKey(readValue: Serialization.readStringValue)
  final String residence;
  @JsonKey(readValue: Serialization.readStringValue)
  final TaskSeverity severity;
  @JsonKey(readValue: Serialization.readStringValue)
  final TaskStatus status;
  @JsonKey(readValue: Serialization.readStringValue)
  final String? note;

  @JsonKey(
      toJson: Serialization.dateTimeToJson,
      fromJson: Serialization.dateTimeFromJson,
      includeIfNull: true)
  DateTime? createdAt;

  @JsonKey(
      toJson: Serialization.dateTimeToJson,
      fromJson: Serialization.dateTimeFromJson,
      includeIfNull: true)
  DateTime? updatedAt;

  static Task empty = Task(
    id: 'flake',
    task: '',
    shift: '',
    residence: '',
    note: '',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  Task copyWith({
    String? id,
    String? task,
    String? shift,
    String? residence,
    String? note,
    DateTime? updatedAt,
    TaskSeverity? severity,
    TaskStatus? status,
  }) {
    return Task(
      id: id ?? this.id,
      task: task ?? this.task,
      shift: shift ?? this.shift,
      residence: residence ?? this.shift,
      updatedAt: updatedAt ?? this.updatedAt,
      severity: severity ?? this.severity,
      status: status ?? this.status,
      note: note ?? this.note,
    );
  }

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  factory Task.fromSnapshot(DocumentSnapshot doc) =>
      Task.fromJson(doc.data() as Map<String, dynamic>? ?? {});

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
