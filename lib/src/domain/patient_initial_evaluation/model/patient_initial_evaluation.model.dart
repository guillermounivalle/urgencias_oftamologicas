import 'package:json_annotation/json_annotation.dart';
import 'package:urgencias_oftamologicas/src/blocs/infrastructure/database/persistent.entity.dart';
import 'package:urgencias_oftamologicas/src/domain/patient_initial_evaluation/model/patient_initial_evaluation.enum.dart';

part 'patient_initial_evaluation.model.g.dart';

@JsonSerializable()
class PatientInitialEvaluation implements PersistentEntity {
  String? documentId;
  String? medicalStaff;
  DateTime? consultationDate ;
  Patology? patology_type;
  InjuredEye? abnormal_fondus; //Fondo de ojo anormal
  InjuredEye? anterior_chamber_alterations;//Alteración Camara Anterior
  InjuredEye? blunt_trauma;//Trauma Contuso
  InjuredEye? blurred_vision;//Visión Borrosa
  InjuredEye? celurity_presence_ca;//Presencia o no presencia de celularidad CA
  InjuredEye? conjuctival_injection;//Inyección conjuntival
  InjuredEye? conjunctivitis; //Conjuntivitis
  InjuredEye? corneal_opacity;//Edema u opacidad corneal
  InjuredEye? decreased_visual_acuity;//Disminución de la agudeza visual
  InjuredEye? diplopia;//Diplopía
  InjuredEye? elevated_intraocular_pressure; //Presión intraocular elevada
  InjuredEye? eye_pain;//dolor ocular
  InjuredEye? eyelid_injury;//Lesión de parpado
  SelectAnswer? fingers_count;//Cuenta dedos?
  InjuredEye? flare_presence;//Presencia o no presencia de Flare
  SelectAnswer? hand_movement; //Movimiento
  SelectAnswer? headache;//dolor de cabeza (Cefalea)
  SelectAnswer? headache_symtom;//Sintoma de dolor de cabeza
  InjuredEye? hyperemia;//Hiperimia
  InjuredEye? iris_alteration;//Alteración del Iris
  InjuredEye? keratitis; //Queratitis
  InjuredEye? lens_alteration;//Alteración del cristalino
  SelectAnswer? light_perception;//Percepción de luz
  String? other_alterations;//Otras Alteraciones
  String? other_sytmtom; //Otros sintomas
  InjuredEye? eyepain;//Dolor(Consulta)
  InjuredEye? penetrating_trauma;//trauma penetrante
  InjuredEye? photophobia;//Fotofobía
  InjuredEye? photopsia; //Fotopsia
  ReferredPatientTo? referred_to;//Enviado a
  InjuredEye? refractive_disorder;//trastorno refractivo
  InjuredEye? secretion;//Secreción
  InjuredEye? strange_body;//Cuerpo extraño en ojo
  InjuredEye? tearducty_injury; //Lesión en lagrimal

  InjuredEye? red_eye;//Ojo Rojo
  InjuredEye? tumors; //Lesión en lagrimal

  PatientInitialEvaluation({
    required this.documentId,
    //required this.medicalStaff,
    required this.patology_type,
    required this.consultationDate,
    required this.anterior_chamber_alterations,
    required this.blunt_trauma,
    required this.blurred_vision,
    required this.celurity_presence_ca,
    required this.conjuctival_injection,
    required this.conjunctivitis,
    required this.corneal_opacity,
    required this.decreased_visual_acuity,
    required this.abnormal_fondus,
    required this.diplopia,
    required this.elevated_intraocular_pressure,
    required this.eye_pain,
    required this.eyelid_injury,
    required this.fingers_count,
    required this.flare_presence,
    required this.hand_movement,
    required this.headache,
    required this.headache_symtom,
    required this.hyperemia,
    required this.iris_alteration,
    required this.keratitis,
    required this.lens_alteration,
    required this.light_perception,
    required this.other_alterations,
    required this.other_sytmtom,
    required this.eyepain,
    required this.penetrating_trauma,
    required this.photophobia,
    required this.photopsia,
    required this.referred_to,
    required this.refractive_disorder,
    required this.secretion,
    required this.strange_body,
    required this.tearducty_injury,
    required this.red_eye,
    required this.tumors,
  });

  PatientInitialEvaluation.createNew();

  Map<String, dynamic> toJson() => _$PatientInitialEvaluationToJson(this);

  factory PatientInitialEvaluation.fromJson(Map<String, dynamic> json) =>
      _$PatientInitialEvaluationFromJson(json);

  @override
  String getId() => documentId!;
}