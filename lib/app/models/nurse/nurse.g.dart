// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nurse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Nurse _$NurseFromJson(Map json) => Nurse(
      id: Serialization.readStringValue(json, 'id') as String,
      name: Serialization.readStringValue(json, 'name') as String?,
      shift: Serialization.readStringValue(json, 'shift') as String?,
    );

Map<String, dynamic> _$NurseToJson(Nurse instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shift': instance.shift,
    };
