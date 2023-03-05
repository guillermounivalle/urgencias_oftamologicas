import 'package:json_annotation/json_annotation.dart';
import 'package:urgencias_oftamologicas/src/blocs/infrastructure/database/persistent.entity.dart';
import 'package:urgencias_oftamologicas/src/domain/patient_surgery/model/patientsurgery.enum.dart';

//Note: For Serialize and make model.g.dart, use command "flutter pub run build_runner build" to console
part 'patientsurgery.model.g.dart';

@JsonSerializable()
class PatientSurgery implements PersistentEntity {
  String? documentId;  //Documento de identidad
  String? medicalStaff;  //Personal mèdico
  DateTime? consultationDate; //fecha de la consulta
  PrevSurgeryDays? prevSurgeryDays; //Días de estancia antes de cirugía
  SelectAnswer? conjuctivalSuture; //Sutura de conjuntiva
  SelectAnswer? cornealSuture; //Sutura de cornea
  SelectAnswer? scleraSuture; //Sutura de cornea
  SelectAnswer? eyelidSuture; //Sutura de parpado
  SelectAnswer? lacrimalIntubation; // Intubación ducto lagrimal
  SelectAnswer? facoWithLio;//Faco + LIO
  SelectAnswer? facoWithoutLio;//Faco sin LIO
  SelectAnswer? abscessDrainage;//Drenaje de absceso
  SelectAnswer? eyeEvisceration;//Evisceración
  SelectAnswer? conjutivalLining;//Recubrimiento conjuntival
  SelectAnswer? victrectomy;//Vitrectomía
  SelectAnswer? amnioticMembrane;//Injerto de membrana amniótica
  VisualAcuity? visualAcuityFirstPop;//AGUDEZA VISUAL EN PRIMER PO

  PatientSurgery({
    required this.documentId,
    required this.medicalStaff,
    required this.consultationDate,
    required this.prevSurgeryDays,
    required this.conjuctivalSuture,
    required this.cornealSuture,
    required this.scleraSuture,
    required this.eyelidSuture,
    required this.lacrimalIntubation,
    required this.facoWithLio,
    required this.facoWithoutLio,
    required this.abscessDrainage,
    required this.eyeEvisceration,
    required this.conjutivalLining,
    required this.victrectomy,
    required this.amnioticMembrane,
    required this.visualAcuityFirstPop,

  });
PatientSurgery.createNew();

  Map<String, dynamic> toJson() => _$PatientSurgeryToJson(this);

  factory PatientSurgery.fromJson(Map<String, dynamic> json) =>
  _$PatientSurgeryFromJson(json);

  @override
  String getId() => documentId!;

}
