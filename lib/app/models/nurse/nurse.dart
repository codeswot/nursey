import 'package:nursey/app/utils/serialisable.dart';
import 'package:nursey/configs/configs.dart';

part 'nurse.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class Nurse extends Equatable {
  const Nurse({
    required this.id,
    this.name,
    this.shift,
  });
  @JsonKey(readValue: Serialization.readStringValue)
  final String id;
  @JsonKey(readValue: Serialization.readStringValue)
  final String? name;
  @JsonKey(readValue: Serialization.readStringValue)
  final String? shift;

  static const empty = Nurse(
    id: 'flake',
    name: '',
    shift: '',
  );

  Nurse copyWith({
    String? id,
    String? name,
    String? shift,
  }) {
    return Nurse(
      id: id ?? this.id,
      name: name ?? this.name,
      shift: shift ?? this.shift,
    );
  }

  factory Nurse.fromJson(Map<String, dynamic> json) => _$NurseFromJson(json);

  factory Nurse.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) =>
      Nurse.fromJson(doc.data() ?? {});

  Map<String, dynamic> toJson() => _$NurseToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        shift,
      ];
}
