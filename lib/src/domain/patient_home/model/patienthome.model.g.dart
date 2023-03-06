// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patienthome.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientHome _$PatientHomeFromJson(Map<String, dynamic> json) => PatientHome(
      documentId: json['documentId'] as String?,
      medicalStaff: json['medicalStaff'] as String?,
      consultationDate: json['consultationDate'] == null
          ? null
          : DateTime.parse(json['consultationDate'] as String),
      receivedAntibiotics: $enumDecodeNullable(
          _$SelectAnswerEnumMap, json['receivedAntibiotics']),
      receivedAntiinflmatories: $enumDecodeNullable(
          _$SelectAnswerEnumMap, json['receivedAntiinflmatories']),
      receivedOcularhypotensives: $enumDecodeNullable(
          _$SelectAnswerEnumMap, json['receivedOcularhypotensives']),
      receivedLubricants: $enumDecodeNullable(
          _$SelectAnswerEnumMap, json['receivedLubricants']),
      receivedAnalgesics: $enumDecodeNullable(
          _$SelectAnswerEnumMap, json['receivedAnalgesics']),
      interConsultationstosupraspecialty: $enumDecodeNullable(
          _$SelectAnswerEnumMap, json['interConsultationstosupraspecialty']),
      visualAcuitytoleaving: $enumDecodeNullable(
          _$VisualAcuityEnumMap, json['visualAcuitytoleaving']),
    );

Map<String, dynamic> _$PatientHomeToJson(PatientHome instance) =>
    <String, dynamic>{
      'documentId': instance.documentId,
      'medicalStaff': instance.medicalStaff,
      'consultationDate': instance.consultationDate?.toIso8601String(),
      'receivedAntibiotics':
          _$SelectAnswerEnumMap[instance.receivedAntibiotics],
      'receivedAntiinflmatories':
          _$SelectAnswerEnumMap[instance.receivedAntiinflmatories],
      'receivedOcularhypotensives':
          _$SelectAnswerEnumMap[instance.receivedOcularhypotensives],
      'receivedLubricants': _$SelectAnswerEnumMap[instance.receivedLubricants],
      'receivedAnalgesics': _$SelectAnswerEnumMap[instance.receivedAnalgesics],
      'interConsultationstosupraspecialty':
          _$SelectAnswerEnumMap[instance.interConsultationstosupraspecialty],
      'visualAcuitytoleaving':
          _$VisualAcuityEnumMap[instance.visualAcuitytoleaving],
    };

const _$SelectAnswerEnumMap = {
  SelectAnswer.YES: 'Si',
  SelectAnswer.NOT: 'No',
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
