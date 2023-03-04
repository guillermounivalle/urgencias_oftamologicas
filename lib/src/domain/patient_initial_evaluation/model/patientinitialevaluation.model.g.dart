// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patientinitialevaluation.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientInitialEvaluation _$PatientInitialEvaluationFromJson(
        Map<String, dynamic> json) =>
    PatientInitialEvaluation(
      documentId: json['documentId'] as String?,
      medicalStaff: json['medicalStaff'] as String?,
      patologyType:
          $enumDecodeNullable(_$PatologyEnumMap, json['patologyType']),
      consultationDate: json['consultationDate'] == null
          ? null
          : DateTime.parse(json['consultationDate'] as String),
      anteriorChamberAlterations: $enumDecodeNullable(
          _$InjuredEyeEnumMap, json['anteriorChamberAlterations']),
      bluntTrauma:
          $enumDecodeNullable(_$InjuredEyeEnumMap, json['bluntTrauma']),
      blurredVision:
          $enumDecodeNullable(_$InjuredEyeEnumMap, json['blurredVision']),
      celurityPresenceCA:
          $enumDecodeNullable(_$InjuredEyeEnumMap, json['celurityPresenceCA']),
      conjuctivalInjection: $enumDecodeNullable(
          _$InjuredEyeEnumMap, json['conjuctivalInjection']),
      conjunctivitis:
          $enumDecodeNullable(_$InjuredEyeEnumMap, json['conjunctivitis']),
      cornealOpacity:
          $enumDecodeNullable(_$InjuredEyeEnumMap, json['cornealOpacity']),
      decreasedVisualAcuity: $enumDecodeNullable(
          _$InjuredEyeEnumMap, json['decreasedVisualAcuity']),
      abnormalFondus:
          $enumDecodeNullable(_$InjuredEyeEnumMap, json['abnormalFondus']),
      diplopia: $enumDecodeNullable(_$InjuredEyeEnumMap, json['diplopia']),
      elevatedIntraocularPressure: $enumDecodeNullable(
          _$InjuredEyeEnumMap, json['elevatedIntraocularPressure']),
      eyePain: $enumDecodeNullable(_$InjuredEyeEnumMap, json['eyePain']),
      eyelidInjury:
          $enumDecodeNullable(_$InjuredEyeEnumMap, json['eyelidInjury']),
      fingersCount:
          $enumDecodeNullable(_$SelectAnswerEnumMap, json['fingersCount']),
      flarePresence:
          $enumDecodeNullable(_$InjuredEyeEnumMap, json['flarePresence']),
      handMovement:
          $enumDecodeNullable(_$SelectAnswerEnumMap, json['handMovement']),
      headache: $enumDecodeNullable(_$SelectAnswerEnumMap, json['headache']),
      headacheSymtom:
          $enumDecodeNullable(_$SelectAnswerEnumMap, json['headacheSymtom']),
      hyperemia: $enumDecodeNullable(_$InjuredEyeEnumMap, json['hyperemia']),
      irisAlteration:
          $enumDecodeNullable(_$InjuredEyeEnumMap, json['irisAlteration']),
      keratitis: $enumDecodeNullable(_$InjuredEyeEnumMap, json['keratitis']),
      lensAlteration:
          $enumDecodeNullable(_$InjuredEyeEnumMap, json['lensAlteration']),
      lightPerception:
          $enumDecodeNullable(_$SelectAnswerEnumMap, json['lightPerception']),
      otherAlterations: json['otherAlterations'] as String?,
      otherSytmtom: json['otherSytmtom'] as String?,
      eyepain: $enumDecodeNullable(_$InjuredEyeEnumMap, json['eyepain']),
      penetratingTrauma:
          $enumDecodeNullable(_$InjuredEyeEnumMap, json['penetratingTrauma']),
      photophobia:
          $enumDecodeNullable(_$InjuredEyeEnumMap, json['photophobia']),
      photopsia: $enumDecodeNullable(_$InjuredEyeEnumMap, json['photopsia']),
      referredTo:
          $enumDecodeNullable(_$ReferredPatientToEnumMap, json['referredTo']),
      refractiveDisorder:
          $enumDecodeNullable(_$InjuredEyeEnumMap, json['refractiveDisorder']),
      secretion: $enumDecodeNullable(_$InjuredEyeEnumMap, json['secretion']),
      strangeBody:
          $enumDecodeNullable(_$InjuredEyeEnumMap, json['strangeBody']),
      tearductyInjury:
          $enumDecodeNullable(_$InjuredEyeEnumMap, json['tearductyInjury']),
      redEye: $enumDecodeNullable(_$InjuredEyeEnumMap, json['redEye']),
      tumors: $enumDecodeNullable(_$InjuredEyeEnumMap, json['tumors']),
      tearing: $enumDecodeNullable(_$InjuredEyeEnumMap, json['tearing']),
      visualAcuity:
          $enumDecodeNullable(_$VisualAcuityEnumMap, json['visualAcuity']),
    );

Map<String, dynamic> _$PatientInitialEvaluationToJson(
        PatientInitialEvaluation instance) =>
    <String, dynamic>{
      'documentId': instance.documentId,
      'medicalStaff': instance.medicalStaff,
      'consultationDate': instance.consultationDate?.toIso8601String(),
      'patologyType': _$PatologyEnumMap[instance.patologyType],
      'abnormalFondus': _$InjuredEyeEnumMap[instance.abnormalFondus],
      'anteriorChamberAlterations':
          _$InjuredEyeEnumMap[instance.anteriorChamberAlterations],
      'bluntTrauma': _$InjuredEyeEnumMap[instance.bluntTrauma],
      'blurredVision': _$InjuredEyeEnumMap[instance.blurredVision],
      'celurityPresenceCA': _$InjuredEyeEnumMap[instance.celurityPresenceCA],
      'conjuctivalInjection':
          _$InjuredEyeEnumMap[instance.conjuctivalInjection],
      'conjunctivitis': _$InjuredEyeEnumMap[instance.conjunctivitis],
      'cornealOpacity': _$InjuredEyeEnumMap[instance.cornealOpacity],
      'decreasedVisualAcuity':
          _$InjuredEyeEnumMap[instance.decreasedVisualAcuity],
      'diplopia': _$InjuredEyeEnumMap[instance.diplopia],
      'elevatedIntraocularPressure':
          _$InjuredEyeEnumMap[instance.elevatedIntraocularPressure],
      'eyePain': _$InjuredEyeEnumMap[instance.eyePain],
      'eyelidInjury': _$InjuredEyeEnumMap[instance.eyelidInjury],
      'fingersCount': _$SelectAnswerEnumMap[instance.fingersCount],
      'flarePresence': _$InjuredEyeEnumMap[instance.flarePresence],
      'handMovement': _$SelectAnswerEnumMap[instance.handMovement],
      'headache': _$SelectAnswerEnumMap[instance.headache],
      'headacheSymtom': _$SelectAnswerEnumMap[instance.headacheSymtom],
      'hyperemia': _$InjuredEyeEnumMap[instance.hyperemia],
      'irisAlteration': _$InjuredEyeEnumMap[instance.irisAlteration],
      'keratitis': _$InjuredEyeEnumMap[instance.keratitis],
      'lensAlteration': _$InjuredEyeEnumMap[instance.lensAlteration],
      'lightPerception': _$SelectAnswerEnumMap[instance.lightPerception],
      'otherAlterations': instance.otherAlterations,
      'otherSytmtom': instance.otherSytmtom,
      'eyepain': _$InjuredEyeEnumMap[instance.eyepain],
      'penetratingTrauma': _$InjuredEyeEnumMap[instance.penetratingTrauma],
      'photophobia': _$InjuredEyeEnumMap[instance.photophobia],
      'photopsia': _$InjuredEyeEnumMap[instance.photopsia],
      'referredTo': _$ReferredPatientToEnumMap[instance.referredTo],
      'refractiveDisorder': _$InjuredEyeEnumMap[instance.refractiveDisorder],
      'secretion': _$InjuredEyeEnumMap[instance.secretion],
      'strangeBody': _$InjuredEyeEnumMap[instance.strangeBody],
      'tearductyInjury': _$InjuredEyeEnumMap[instance.tearductyInjury],
      'redEye': _$InjuredEyeEnumMap[instance.redEye],
      'tumors': _$InjuredEyeEnumMap[instance.tumors],
      'tearing': _$InjuredEyeEnumMap[instance.tearing],
      'visualAcuity': _$VisualAcuityEnumMap[instance.visualAcuity],
    };

const _$PatologyEnumMap = {
  Patology.TRAUMATIC: 'Traumática',
  Patology.NOT_TRAUMATIC: 'No Traumática',
};

const _$InjuredEyeEnumMap = {
  InjuredEye.RIGHT: 'Ojo Derecho',
  InjuredEye.LEFT: 'Ojo Izquierdo',
  InjuredEye.BOTH: 'Ambos Ojos',
  InjuredEye.NONE: 'Ninguno',
};

const _$SelectAnswerEnumMap = {
  SelectAnswer.YES: 'Si',
  SelectAnswer.NOT: 'No',
};

const _$ReferredPatientToEnumMap = {
  ReferredPatientTo.RIGHT: 'Hospitalización',
  ReferredPatientTo.LEFT: 'Cirugía',
  ReferredPatientTo.BOTH: 'Cuidado en casa',
  ReferredPatientTo.NONE: 'Cuidado en Casa',
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
