// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patienthospitalization.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientHospitalization _$PatientHospitalizationFromJson(
        Map<String, dynamic> json) =>
    PatientHospitalization(
      documentId: json['documentId'] as String?,
      medicalStaff: json['medicalStaff'] as String?,
      consultationDate: json['consultationDate'] == null
          ? null
          : DateTime.parse(json['consultationDate'] as String),
      receivedAntibiotics: $enumDecodeNullable(
          _$SelectAnswerEnumMap, json['receivedAntibiotics']),
      hospitalizationDays: $enumDecodeNullable(
          _$HospitalizationDaysEnumMap, json['hospitalizationDays']),
      receivedAntiinflmatories: $enumDecodeNullable(
          _$SelectAnswerEnumMap, json['receivedAntiinflmatories']),
      receivedOcularhypotensives: $enumDecodeNullable(
          _$SelectAnswerEnumMap, json['receivedOcularhypotensives']),
      receivedLubricants: $enumDecodeNullable(
          _$SelectAnswerEnumMap, json['receivedLubricants']),
      receivedAntiasgiogenics: $enumDecodeNullable(
          _$SelectAnswerEnumMap, json['receivedAntiasgiogenics']),
      interConsultationstosupraspecialty: $enumDecodeNullable(
          _$SelectAnswerEnumMap, json['interConsultationstosupraspecialty']),
      visualAcuitytoleaving: $enumDecodeNullable(
          _$VisualAcuityEnumMap, json['visualAcuitytoleaving']),
    );

Map<String, dynamic> _$PatientHospitalizationToJson(
        PatientHospitalization instance) =>
    <String, dynamic>{
      'documentId': instance.documentId,
      'medicalStaff': instance.medicalStaff,
      'consultationDate': instance.consultationDate?.toIso8601String(),
      'hospitalizationDays':
          _$HospitalizationDaysEnumMap[instance.hospitalizationDays],
      'receivedAntibiotics':
          _$SelectAnswerEnumMap[instance.receivedAntibiotics],
      'receivedAntiinflmatories':
          _$SelectAnswerEnumMap[instance.receivedAntiinflmatories],
      'receivedOcularhypotensives':
          _$SelectAnswerEnumMap[instance.receivedOcularhypotensives],
      'receivedLubricants': _$SelectAnswerEnumMap[instance.receivedLubricants],
      'receivedAntiasgiogenics':
          _$SelectAnswerEnumMap[instance.receivedAntiasgiogenics],
      'interConsultationstosupraspecialty':
          _$SelectAnswerEnumMap[instance.interConsultationstosupraspecialty],
      'visualAcuitytoleaving':
          _$VisualAcuityEnumMap[instance.visualAcuitytoleaving],
    };

const _$SelectAnswerEnumMap = {
  SelectAnswer.YES: 'Si',
  SelectAnswer.NOT: 'No',
};

const _$HospitalizationDaysEnumMap = {
  HospitalizationDays.ONE: '1',
  HospitalizationDays.TWO: '2',
  HospitalizationDays.THREE: '3',
  HospitalizationDays.FOUR: '4',
  HospitalizationDays.FIVE: '5',
  HospitalizationDays.SIX: '6',
  HospitalizationDays.SEVEN: '7',
  HospitalizationDays.EIGHT: '8',
  HospitalizationDays.NINE: '9',
  HospitalizationDays.TEN: '10',
  HospitalizationDays.OTHER: '+10',
};

const _$VisualAcuityEnumMap = {
  VisualAcuity.ONE: '20/20',
  VisualAcuity.TWO: '20/25',
  VisualAcuity.THREE: '20/30',
  VisualAcuity.FOUR: '20/40',
  VisualAcuity.FIVE: '20/60',
  VisualAcuity.SIX: '20/80',
  VisualAcuity.SEVEN: '20/100',
  VisualAcuity.EIGHT: '20/150',
  VisualAcuity.NINE: '20/200',
  VisualAcuity.TEN: '20/400',
};
