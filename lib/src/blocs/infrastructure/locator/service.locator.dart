import 'package:get_it/get_it.dart';
import 'package:urgencias_oftamologicas/src/domain/patient_home/app/patienthome.service.dart';
import 'package:urgencias_oftamologicas/src/domain/patient_surgery/app/patientsurgery.service.dart';
import '../../../repository/services/auth.dart';
import '../auth/auth.service.dart';
import 'package:urgencias_oftamologicas/src/domain/patient/app/patient.service.dart';
import 'package:urgencias_oftamologicas/src/domain/patient_initial_evaluation/app/patientinitialevaluation.service.dart';
import 'package:urgencias_oftamologicas/src/domain/patient_hospitalization/app/patienthospitalization.service.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // Infrastructure services
  serviceLocator.registerSingleton(AuthService());
  serviceLocator.registerSingleton(AuthorizationService());
  serviceLocator.registerSingleton(PatientService());
  serviceLocator.registerSingleton(PatientInitialEvaluationService());
  serviceLocator.registerSingleton(PatientHospitalizationService());
  serviceLocator.registerSingleton(PatientSurgeryService());
  serviceLocator.registerSingleton(PatientHomeService());
}
