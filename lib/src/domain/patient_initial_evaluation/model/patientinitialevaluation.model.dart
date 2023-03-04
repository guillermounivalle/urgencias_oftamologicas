import 'package:json_annotation/json_annotation.dart';
import 'package:urgencias_oftamologicas/src/blocs/infrastructure/database/persistent.entity.dart';
import 'package:urgencias_oftamologicas/src/domain/patient_initial_evaluation/model/patientinitialevaluation.enum.dart';

part 'patientinitialevaluation.model.g.dart';

@JsonSerializable()
class PatientInitialEvaluation implements PersistentEntity {
  String? documentId;
  String? medicalStaff;
  DateTime? consultationDate ;
  Patology? patologyType;
  InjuredEye? abnormalFondus; //Fondo de ojo anormal
  InjuredEye? anteriorChamberAlterations;//Alteración Camara Anterior
  InjuredEye? bluntTrauma;//Trauma Contuso
  InjuredEye? blurredVision;//Visión Borrosa
  InjuredEye? celurityPresenceCA;//Presencia o no presencia de celularidad CA
  InjuredEye? conjuctivalInjection;//Inyección conjuntival
  InjuredEye? conjunctivitis; //Conjuntivitis
  InjuredEye? cornealOpacity;//Edema u opacidad corneal
  InjuredEye? decreasedVisualAcuity;//Disminución de la agudeza visual
  InjuredEye? diplopia;//Diplopía
  InjuredEye? elevatedIntraocularPressure; //Presión intraocular elevada
  InjuredEye? eyePain;//dolor ocular
  InjuredEye? eyelidInjury;//Lesión de parpado
  SelectAnswer? fingersCount;//Cuenta dedos?
  InjuredEye? flarePresence;//Presencia o no presencia de Flare
  SelectAnswer? handMovement; //Movimiento
  SelectAnswer? headache;//dolor de cabeza (Cefalea)
  SelectAnswer? headacheSymtom;//Sintoma de dolor de cabeza
  InjuredEye? hyperemia;//Hiperimia
  InjuredEye? irisAlteration;//Alteración del Iris
  InjuredEye? keratitis; //Queratitis
  InjuredEye? lensAlteration;//Alteración del cristalino
  SelectAnswer? lightPerception;//Percepción de luz
  String? otherAlterations;//Otras Alteraciones
  String? otherSytmtom; //Otros sintomas
  InjuredEye? eyepain;//Dolor(Consulta)
  InjuredEye? penetratingTrauma;//trauma penetrante
  InjuredEye? photophobia;//Fotofobía
  InjuredEye? photopsia; //Fotopsia
  ReferredPatientTo? referredTo;//Enviado a
  InjuredEye? refractiveDisorder;//trastorno refractivo
  InjuredEye? secretion;//Secreción
  InjuredEye? strangeBody;//Cuerpo extraño en ojo
  InjuredEye? tearductyInjury; //Lesión en lagrimal
  InjuredEye? redEye;//Ojo Rojo
  InjuredEye? tumors; //Tumor
  InjuredEye? tearing; //Tumor
  VisualAcuity? visualAcuity;

  PatientInitialEvaluation({
    required this.documentId,
    required this.medicalStaff,
    required this.patologyType,
    required this.consultationDate,
    required this.anteriorChamberAlterations,
    required this.bluntTrauma,
    required this.blurredVision,
    required this.celurityPresenceCA,
    required this.conjuctivalInjection,
    required this.conjunctivitis,
    required this.cornealOpacity,
    required this.decreasedVisualAcuity,
    required this.abnormalFondus,
    required this.diplopia,
    required this.elevatedIntraocularPressure,
    required this.eyePain,
    required this.eyelidInjury,
    required this.fingersCount,
    required this.flarePresence,
    required this.handMovement,
    required this.headache,
    required this.headacheSymtom,
    required this.hyperemia,
    required this.irisAlteration,
    required this.keratitis,
    required this.lensAlteration,
    required this.lightPerception,
    required this.otherAlterations,
    required this.otherSytmtom,
    required this.eyepain,
    required this.penetratingTrauma,
    required this.photophobia,
    required this.photopsia,
    required this.referredTo,
    required this.refractiveDisorder,
    required this.secretion,
    required this.strangeBody,
    required this.tearductyInjury,
    required this.redEye,
    required this.tumors,
    required this.tearing,
    required this.visualAcuity
  });

  PatientInitialEvaluation.createNew();

  Map<String, dynamic> toJson() => _$PatientInitialEvaluationToJson(this);

  factory PatientInitialEvaluation.fromJson(Map<String, dynamic> json) =>
      _$PatientInitialEvaluationFromJson(json);

  @override
  String getId() => documentId!;
}