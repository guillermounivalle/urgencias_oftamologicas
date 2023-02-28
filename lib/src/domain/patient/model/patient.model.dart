import 'package:json_annotation/json_annotation.dart';
import 'package:urgencias_oftamologicas/src/blocs/infrastructure/database/persistent.entity.dart';
import 'package:urgencias_oftamologicas/src/domain/patient/model/patient.enum.dart';

part 'patient.model.g.dart';

@JsonSerializable()
class Patient implements PersistentEntity {
  String? name;
  String? lastname;
  String? documentId;
  Gender? gender;
  EconomicStratum? socioeconomic;
  Scholarship? schooling;
  Provenance? source;
  DateTime? birthdate;
  DateTime? consultationDate ;

  Patient({
    required this.name,
    required this. lastname,
    required this.documentId,
    required this.gender,
    required this.socioeconomic,
    required this.schooling,
    required this.source,
    required this.birthdate,
    required this.consultationDate,
  });

  Patient.createNew();

  Map<String, dynamic> toJson() => _$PatientToJson(this);

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);

  @override
  String getId() => documentId!;
}