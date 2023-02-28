// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Patient _$PatientFromJson(Map<String, dynamic> json) => Patient(
      name: json['name'] as String?,
      lastname: json['lastname'] as String?,
      documentId: json['documentId'] as String?,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      socioeconomic:
          $enumDecodeNullable(_$EconomicStratumEnumMap, json['socioeconomic']),
      schooling: $enumDecodeNullable(_$ScholarshipEnumMap, json['schooling']),
      source: $enumDecodeNullable(_$ProvenanceEnumMap, json['source']),
      birthdate: json['birthdate'] == null
          ? null
          : DateTime.parse(json['birthdate'] as String),
      consultationDate: json['consultationDate'] == null
          ? null
          : DateTime.parse(json['consultationDate'] as String),
    );

Map<String, dynamic> _$PatientToJson(Patient instance) => <String, dynamic>{
      'name': instance.name,
      'lastname': instance.lastname,
      'documentId': instance.documentId,
      'gender': _$GenderEnumMap[instance.gender],
      'socioeconomic': _$EconomicStratumEnumMap[instance.socioeconomic],
      'schooling': _$ScholarshipEnumMap[instance.schooling],
      'source': _$ProvenanceEnumMap[instance.source],
      'birthdate': instance.birthdate?.toIso8601String(),
      'consultationDate': instance.consultationDate?.toIso8601String(),
    };

const _$GenderEnumMap = {
  Gender.MALE: 'Masculino',
  Gender.FEMALE: 'Femenino',
  Gender.OTHER: 'Otro',
};

const _$EconomicStratumEnumMap = {
  EconomicStratum.ONE: '1',
  EconomicStratum.TWO: '2',
  EconomicStratum.THREE: '3',
  EconomicStratum.FOUR: '4',
  EconomicStratum.FIVE: '5',
  EconomicStratum.SIX: '6',
  EconomicStratum.OTHER: '+6',
};

const _$ScholarshipEnumMap = {
  Scholarship.ELEMENTARY: 'Primaria',
  Scholarship.HIGH_SCHOOL: 'Secundaria',
  Scholarship.UNDERGRADE: 'Pre-Grado',
  Scholarship.GRADUATE: 'Post-Grado',
};

const _$ProvenanceEnumMap = {
  Provenance.URBAN: 'Urbana',
  Provenance.RURAL: 'Rural',
};
