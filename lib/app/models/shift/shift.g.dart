// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shift _$ShiftFromJson(Map json) => Shift(
      id: Serialization.readStringValue(json, 'id') as String,
      name: Serialization.readStringValue(json, 'name') as String?,
      startTime: Serialization.readTimeValue(json, 'startTime') == null
          ? null
          : Time.fromJson(Map<String, dynamic>.from(
              Serialization.readTimeValue(json, 'startTime') as Map)),
      endTime: Serialization.readTimeValue(json, 'endTime') == null
          ? null
          : Time.fromJson(Map<String, dynamic>.from(
              Serialization.readTimeValue(json, 'endTime') as Map)),
    );

Map<String, dynamic> _$ShiftToJson(Shift instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'startTime': instance.startTime?.toJson(),
      'endTime': instance.endTime?.toJson(),
    };
