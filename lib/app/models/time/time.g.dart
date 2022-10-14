// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Time _$TimeFromJson(Map json) => Time(
      json['hour'] as int? ?? 0,
      json['minute'] as int? ?? 0,
      json['second'] as int? ?? 0,
    );

Map<String, dynamic> _$TimeToJson(Time instance) => <String, dynamic>{
      'hour': instance.hour,
      'minute': instance.minute,
      'second': instance.second,
    };
