import 'package:nursey/app/utils/serialisable.dart';
import 'package:nursey/configs/configs.dart';

part 'residence.g.dart';

enum ResidenceGender { male, female }

extension ResidenceGenderX on ResidenceGender {
  bool get isMale => this == ResidenceGender.male;
  bool get isFemale => this == ResidenceGender.female;
}

@JsonSerializable(anyMap: true, explicitToJson: true)
class Residence extends Equatable {
  const Residence({
    required this.id,
    this.name,
    required this.age,
    this.gender,
  });
  @JsonKey(readValue: Serialization.readStringValue)
  final String id;
  @JsonKey(readValue: Serialization.readStringValue)
  final ResidenceGender? gender;
  @JsonKey(readValue: Serialization.readStringValue)
  final String? name;
  @JsonKey(readValue: Serialization.readIntValue)
  final int age;

  static const empty = Residence(
    id: 'flake',
    name: '',
    gender: ResidenceGender.male,
    age: 0,
  );

  Residence copyWith({
    String? id,
    String? name,
    int? age,
  }) {
    return Residence(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      gender: gender ?? gender,
    );
  }

  factory Residence.fromJson(Map<String, dynamic> json) =>
      _$ResidenceFromJson(json);

  factory Residence.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) =>
      Residence.fromJson(doc.data() ?? {});

  Map<String, dynamic> toJson() => _$ResidenceToJson(this);

  @override
  List<Object?> get props => [id, name, age, gender];
}
