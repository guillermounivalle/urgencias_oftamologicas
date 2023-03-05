// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patientsurgery.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientSurgery _$PatientSurgeryFromJson(Map<String, dynamic> json) =>
    PatientSurgery(
      documentId: json['documentId'] as String?,
      medicalStaff: json['medicalStaff'] as String?,
      consultationDate: json['consultationDate'] == null
          ? null
          : DateTime.parse(json['consultationDate'] as String),
      prevSurgeryDays: $enumDecodeNullable(
          _$PrevSurgeryDaysEnumMap, json['prevSurgeryDays']),
      conjuctivalSuture:
          $enumDecodeNullable(_$SelectAnswerEnumMap, json['conjuctivalSuture']),
      cornealSuture:
          $enumDecodeNullable(_$SelectAnswerEnumMap, json['cornealSuture']),
      scleraSuture:
          $enumDecodeNullable(_$SelectAnswerEnumMap, json['scleraSuture']),
      eyelidSuture:
          $enumDecodeNullable(_$SelectAnswerEnumMap, json['eyelidSuture']),
      lacrimalIntubation: $enumDecodeNullable(
          _$SelectAnswerEnumMap, json['lacrimalIntubation']),
      facoWithLio:
          $enumDecodeNullable(_$SelectAnswerEnumMap, json['facoWithLio']),
      facoWithoutLio:
          $enumDecodeNullable(_$SelectAnswerEnumMap, json['facoWithoutLio']),
      abscessDrainage:
          $enumDecodeNullable(_$SelectAnswerEnumMap, json['abscessDrainage']),
      eyeEvisceration:
          $enumDecodeNullable(_$SelectAnswerEnumMap, json['eyeEvisceration']),
      conjutivalLining:
          $enumDecodeNullable(_$SelectAnswerEnumMap, json['conjutivalLining']),
      victrectomy:
          $enumDecodeNullable(_$SelectAnswerEnumMap, json['victrectomy']),
      amnioticMembrane:
          $enumDecodeNullable(_$SelectAnswerEnumMap, json['amnioticMembrane']),
      visualAcuityFirstPop: $enumDecodeNullable(
          _$VisualAcuityEnumMap, json['visualAcuityFirstPop']),
    );

Map<String, dynamic> _$PatientSurgeryToJson(PatientSurgery instance) =>
    <String, dynamic>{
      'documentId': instance.documentId,
      'medicalStaff': instance.medicalStaff,
      'consultationDate': instance.consultationDate?.toIso8601String(),
      'prevSurgeryDays': _$PrevSurgeryDaysEnumMap[instance.prevSurgeryDays],
      'conjuctivalSuture': _$SelectAnswerEnumMap[instance.conjuctivalSuture],
      'cornealSuture': _$SelectAnswerEnumMap[instance.cornealSuture],
      'scleraSuture': _$SelectAnswerEnumMap[instance.scleraSuture],
      'eyelidSuture': _$SelectAnswerEnumMap[instance.eyelidSuture],
      'lacrimalIntubation': _$SelectAnswerEnumMap[instance.lacrimalIntubation],
      'facoWithLio': _$SelectAnswerEnumMap[instance.facoWithLio],
      'facoWithoutLio': _$SelectAnswerEnumMap[instance.facoWithoutLio],
      'abscessDrainage': _$SelectAnswerEnumMap[instance.abscessDrainage],
      'eyeEvisceration': _$SelectAnswerEnumMap[instance.eyeEvisceration],
      'conjutivalLining': _$SelectAnswerEnumMap[instance.conjutivalLining],
      'victrectomy': _$SelectAnswerEnumMap[instance.victrectomy],
      'amnioticMembrane': _$SelectAnswerEnumMap[instance.amnioticMembrane],
      'visualAcuityFirstPop':
          _$VisualAcuityEnumMap[instance.visualAcuityFirstPop],
    };

const _$PrevSurgeryDaysEnumMap = {
  PrevSurgeryDays.ONE: '1',
  PrevSurgeryDays.TWO: '2',
  PrevSurgeryDays.THREE: '3',
  PrevSurgeryDays.FOUR: '4',
  PrevSurgeryDays.FIVE: '5',
  PrevSurgeryDays.SIX: '6',
  PrevSurgeryDays.SEVEN: '7',
  PrevSurgeryDays.EIGHT: '8',
  PrevSurgeryDays.NINE: '9',
  PrevSurgeryDays.TEN: '10',
  PrevSurgeryDays.OTHER: '+10',
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
