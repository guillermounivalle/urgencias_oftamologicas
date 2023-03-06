import 'package:json_annotation/json_annotation.dart';
import 'package:urgencias_oftamologicas/src/blocs/infrastructure/database/persistent.entity.dart';
import 'package:urgencias_oftamologicas/src/domain/patient_home/model/patienthome.enum.dart';


//Note: For Serialize and make model.g.dart, use command "flutter pub run build_runner build" to console
part 'patienthome.model.g.dart';

@JsonSerializable()
class PatientHome implements PersistentEntity{

  String? documentId;  //Documento de identidad
  String? medicalStaff;  //Personal mèdico
  DateTime? consultationDate; //fecha de la consulta
  SelectAnswer? receivedAntibiotics; //Recibión Antibióticos
  SelectAnswer? receivedAntiinflmatories; //Recibiò Anti-inflamatorios
  SelectAnswer? receivedOcularhypotensives; //Recibió hipertensores oculares
  SelectAnswer? receivedLubricants; //Recibió Lubricantes
  SelectAnswer? receivedAnalgesics; //Recibió antiangiogenicos
  SelectAnswer? interConsultationstosupraspecialty; //Interconsultas a Supraspecialidad
  VisualAcuity? visualAcuitytoleaving; //Agudeza visual al egreso
  PatientHome({
    required this.documentId,
    required this.medicalStaff,
    required this.consultationDate,
    required this.receivedAntibiotics,
    required this.receivedAntiinflmatories,
    required this.receivedOcularhypotensives,
    required this.receivedLubricants,
    required this.receivedAnalgesics,
    required this.interConsultationstosupraspecialty,
    required this.visualAcuitytoleaving,
  });
  PatientHome.createNew();

  Map<String, dynamic> toJson() => _$PatientHomeToJson(this);

  factory PatientHome.fromJson(Map<String, dynamic> json) =>
      _$PatientHomeFromJson(json);

  @override
  String getId() => documentId!;
}