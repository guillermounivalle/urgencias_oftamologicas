import 'package:json_annotation/json_annotation.dart';
import 'package:urgencias_oftamologicas/src/blocs/infrastructure/database/persistent.entity.dart';
import 'package:urgencias_oftamologicas/src/domain/patient_hospitalization/model/patienthospitalization.enum.dart';

//Note: For Serialize and make model.g.dart, use command "flutter pub run build_runner build" to console
part 'patienthospitalization.model.g.dart';

@JsonSerializable()
class PatientHospitalization implements PersistentEntity {
  String? documentId;  //Documento de identidad
  String? medicalStaff;  //Personal mèdico
  DateTime? consultationDate; //fecha de la consulta
  HospitalizationDays? hospitalizationDays; //Días de hospitalizaciòn
  SelectAnswer? receivedAntibiotics; //Recibión Antibióticos
  SelectAnswer? receivedAntiinflmatories; //Recibiò Anti-inflamatorios
  SelectAnswer? receivedOcularhypotensives; //Recibió hipertensores oculares
  SelectAnswer? receivedLubricants; //Recibió Lubricantes
  SelectAnswer? receivedAntiasgiogenics; //Recibió antiangiogenicos
  SelectAnswer? interConsultationstosupraspecialty; //Interconsultas a Supraspecialidad
  VisualAcuity? visualAcuitytoleaving; //Agudeza visual al egreso

  PatientHospitalization({
    required this.documentId,
    required this.medicalStaff,
    required this.consultationDate,
    required this.receivedAntibiotics,
    required this.hospitalizationDays,
    required this.receivedAntiinflmatories,
    required this.receivedOcularhypotensives,
    required this.receivedLubricants,
    required this.receivedAntiasgiogenics,
    required this.interConsultationstosupraspecialty,
    required this.visualAcuitytoleaving,
  });

  PatientHospitalization.createNew();

  Map<String, dynamic> toJson() => _$PatientHospitalizationToJson(this);

  factory PatientHospitalization.fromJson(Map<String, dynamic> json) =>
  _$PatientHospitalizationFromJson(json);

@override
String getId() => documentId!;

}