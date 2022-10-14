// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map json) => Task(
      id: Serialization.readStringValue(json, 'id') as String,
      task: Serialization.readStringValue(json, 'task') as String,
      shift: Serialization.readStringValue(json, 'shift') as String,
      residence: Serialization.readStringValue(json, 'residence') as String,
      createdAt: Serialization.dateTimeFromJson(json['createdAt']),
      updatedAt: Serialization.dateTimeFromJson(json['updatedAt']),
      note: Serialization.readStringValue(json, 'note') as String?,
      status: $enumDecodeNullable(_$TaskStatusEnumMap,
              Serialization.readStringValue(json, 'status')) ??
          TaskStatus.pending,
      severity: $enumDecodeNullable(_$TaskSeverityEnumMap,
              Serialization.readStringValue(json, 'severity')) ??
          TaskSeverity.mild,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'task': instance.task,
      'shift': instance.shift,
      'residence': instance.residence,
      'severity': _$TaskSeverityEnumMap[instance.severity]!,
      'status': _$TaskStatusEnumMap[instance.status]!,
      'note': instance.note,
      'createdAt': Serialization.dateTimeToJson(instance.createdAt),
      'updatedAt': Serialization.dateTimeToJson(instance.updatedAt),
    };

const _$TaskStatusEnumMap = {
  TaskStatus.draft: 'draft',
  TaskStatus.pending: 'pending',
  TaskStatus.completed: 'completed',
};

const _$TaskSeverityEnumMap = {
  TaskSeverity.mild: 'mild',
  TaskSeverity.casual: 'casual',
  TaskSeverity.important: 'important',
};
