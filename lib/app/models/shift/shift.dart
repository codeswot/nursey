import 'package:nursey/app/models/models.dart';
import 'package:nursey/app/utils/serialisable.dart';
import 'package:nursey/configs/configs.dart';

part 'shift.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class Shift extends Equatable {
  const Shift({
    required this.id,
    this.name,
    this.startTime,
    this.endTime,
  });
  @JsonKey(readValue: Serialization.readStringValue)
  final String id;
  @JsonKey(readValue: Serialization.readStringValue)
  final String? name;
  @JsonKey(readValue: Serialization.readTimeValue)
  final Time? startTime;
  @JsonKey(readValue: Serialization.readTimeValue)
  final Time? endTime;

  factory Shift.fromJson(Map<String, dynamic> json) => _$ShiftFromJson(json);

  factory Shift.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) =>
      Shift.fromJson(doc.data() ?? {});

  Map<String, dynamic> toJson() => _$ShiftToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        startTime,
        endTime,
      ];
}
