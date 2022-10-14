// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'residence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Residence _$ResidenceFromJson(Map json) => Residence(
      id: Serialization.readStringValue(json, 'id') as String,
      name: Serialization.readStringValue(json, 'name') as String?,
      age: Serialization.readIntValue(json, 'age') as int,
      gender: $enumDecodeNullable(_$ResidenceGenderEnumMap,
              Serialization.readStringValue(json, 'gender')) ??
          ResidenceGender.male,
    );

Map<String, dynamic> _$ResidenceToJson(Residence instance) => <String, dynamic>{
      'id': instance.id,
      'gender': _$ResidenceGenderEnumMap[instance.gender]!,
      'name': instance.name,
      'age': instance.age,
    };

const _$ResidenceGenderEnumMap = {
  ResidenceGender.male: 'male',
  ResidenceGender.female: 'female',
};
