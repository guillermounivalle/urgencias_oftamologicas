// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_initial_evaluation.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientInitialEvaluation _$PatientInitialEvaluationFromJson(
        Map<String, dynamic> json) =>
    PatientInitialEvaluation(
      documentId: json['documentId'] as String?,
      patology_type:
          $enumDecodeNullable(_$PatologyEnumMap, json['patology_type']),
      consultationDate: json['consultationDate'] == null
          ? null
          : DateTime.parse(json['consultationDate'] as String),
      anterior_chamber_alterations: $enumDecodeNullable(
          _$InjuredEyeEnumMap, json['anterior_chamber_alterations']),
      blunt_trauma:
          $enumDecodeNullable(_$InjuredEyeEnumMap, json['blunt_trauma']),
      blurred_vision:
          $enumDecodeNullable(_$InjuredEyeEnumMap, json['blurred_vision']),
      celurity_presence_ca: $enumDecodeNullable(
          _$InjuredEyeEnumMap, json['celurity_presence_ca']),
      conjuctival_injection: $enumDecodeNullable(
          _$InjuredEyeEnumMap, json['conjuctival_injection']),
      conjunctivitis:
          $enumDecodeNullable(_$InjuredEyeEnumMap, json['conjunctivitis']),
      corneal_opacity:
          $enumDecodeNullable(_$InjuredEyeEnumMap, json['corneal_opacity']),
      decreased_visual_acuity: $enumDecodeNullable(
          _$InjuredEyeEnumMap, json['decreased_visual_acuity']),
      abnormal_fondus:
          $enumDecodeNullable(_$InjuredEyeEnumMap, json['abnormal_fondus']),
      diplopia: $enumDecodeNullable(_$InjuredEyeEnumMap, json['diplopia']),
      elevated_intraocular_pressure: $enumDecodeNullable(
          _$InjuredEyeEnumMap, json['elevated_intraocular_pressure']),
      eye_pain: $enumDecodeNullable(_$InjuredEyeEnumMap, json['eye_pain']),
      eyelid_injury:
          $enumDecodeNullable(_$InjuredEyeEnumMap, json['eyelid_injury']),
      fingers_count:
          $enumDecodeNullable(_$SelectAnswerEnumMap, json['fingers_count']),
      flare_presence:
          $enumDecodeNullable(_$InjuredEyeEnumMap, json['flare_presence']),
      hand_movement:
          $enumDecodeNullable(_$SelectAnswerEnumMap, json['hand_movement']),
      headache: $enumDecodeNullable(_$SelectAnswerEnumMap, json['headache']),
      headache_symtom:
          $enumDecodeNullable(_$SelectAnswerEnumMap, json['headache_symtom']),
      hyperemia: $enumDecodeNullable(_$InjuredEyeEnumMap, json['hyperemia']),
      iris_alteration:
          $enumDecodeNullable(_$InjuredEyeEnumMap, json['iris_alteration']),
      keratitis: $enumDecodeNullable(_$InjuredEyeEnumMap, json['keratitis']),
      lens_alteration:
          $enumDecodeNullable(_$InjuredEyeEnumMap, json['lens_alteration']),
      light_perception:
          $enumDecodeNullable(_$SelectAnswerEnumMap, json['light_perception']),
      other_alterations: json['other_alterations'] as String?,
      other_sytmtom: json['other_sytmtom'] as String?,
      eyepain: $enumDecodeNullable(_$InjuredEyeEnumMap, json['eyepain']),
      penetrating_trauma:
          $enumDecodeNullable(_$InjuredEyeEnumMap, json['penetrating_trauma']),
      photophobia:
          $enumDecodeNullable(_$InjuredEyeEnumMap, json['photophobia']),
      photopsia: $enumDecodeNullable(_$InjuredEyeEnumMap, json['photopsia']),
      referred_to:
          $enumDecodeNullable(_$ReferredPatientToEnumMap, json['referred_to']),
      refractive_disorder:
          $enumDecodeNullable(_$InjuredEyeEnumMap, json['refractive_disorder']),
      secretion: $enumDecodeNullable(_$InjuredEyeEnumMap, json['secretion']),
      strange_body:
          $enumDecodeNullable(_$InjuredEyeEnumMap, json['strange_body']),
      tearducty_injury:
          $enumDecodeNullable(_$InjuredEyeEnumMap, json['tearducty_injury']),
      red_eye: $enumDecodeNullable(_$InjuredEyeEnumMap, json['red_eye']),
      tumors: $enumDecodeNullable(_$InjuredEyeEnumMap, json['tumors']),
    )..medicalStaff = json['medicalStaff'] as String?;

Map<String, dynamic> _$PatientInitialEvaluationToJson(
        PatientInitialEvaluation instance) =>
    <String, dynamic>{
      'documentId': instance.documentId,
      'medicalStaff': instance.medicalStaff,
      'consultationDate': instance.consultationDate?.toIso8601String(),
      'patology_type': _$PatologyEnumMap[instance.patology_type],
      'abnormal_fondus': _$InjuredEyeEnumMap[instance.abnormal_fondus],
      'anterior_chamber_alterations':
          _$InjuredEyeEnumMap[instance.anterior_chamber_alterations],
      'blunt_trauma': _$InjuredEyeEnumMap[instance.blunt_trauma],
      'blurred_vision': _$InjuredEyeEnumMap[instance.blurred_vision],
      'celurity_presence_ca':
          _$InjuredEyeEnumMap[instance.celurity_presence_ca],
      'conjuctival_injection':
          _$InjuredEyeEnumMap[instance.conjuctival_injection],
      'conjunctivitis': _$InjuredEyeEnumMap[instance.conjunctivitis],
      'corneal_opacity': _$InjuredEyeEnumMap[instance.corneal_opacity],
      'decreased_visual_acuity':
          _$InjuredEyeEnumMap[instance.decreased_visual_acuity],
      'diplopia': _$InjuredEyeEnumMap[instance.diplopia],
      'elevated_intraocular_pressure':
          _$InjuredEyeEnumMap[instance.elevated_intraocular_pressure],
      'eye_pain': _$InjuredEyeEnumMap[instance.eye_pain],
      'eyelid_injury': _$InjuredEyeEnumMap[instance.eyelid_injury],
      'fingers_count': _$SelectAnswerEnumMap[instance.fingers_count],
      'flare_presence': _$InjuredEyeEnumMap[instance.flare_presence],
      'hand_movement': _$SelectAnswerEnumMap[instance.hand_movement],
      'headache': _$SelectAnswerEnumMap[instance.headache],
      'headache_symtom': _$SelectAnswerEnumMap[instance.headache_symtom],
      'hyperemia': _$InjuredEyeEnumMap[instance.hyperemia],
      'iris_alteration': _$InjuredEyeEnumMap[instance.iris_alteration],
      'keratitis': _$InjuredEyeEnumMap[instance.keratitis],
      'lens_alteration': _$InjuredEyeEnumMap[instance.lens_alteration],
      'light_perception': _$SelectAnswerEnumMap[instance.light_perception],
      'other_alterations': instance.other_alterations,
      'other_sytmtom': instance.other_sytmtom,
      'eyepain': _$InjuredEyeEnumMap[instance.eyepain],
      'penetrating_trauma': _$InjuredEyeEnumMap[instance.penetrating_trauma],
      'photophobia': _$InjuredEyeEnumMap[instance.photophobia],
      'photopsia': _$InjuredEyeEnumMap[instance.photopsia],
      'referred_to': _$ReferredPatientToEnumMap[instance.referred_to],
      'refractive_disorder': _$InjuredEyeEnumMap[instance.refractive_disorder],
      'secretion': _$InjuredEyeEnumMap[instance.secretion],
      'strange_body': _$InjuredEyeEnumMap[instance.strange_body],
      'tearducty_injury': _$InjuredEyeEnumMap[instance.tearducty_injury],
      'red_eye': _$InjuredEyeEnumMap[instance.red_eye],
      'tumors': _$InjuredEyeEnumMap[instance.tumors],
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
