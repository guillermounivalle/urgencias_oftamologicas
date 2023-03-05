import 'package:urgencias_oftamologicas/src/blocs/infrastructure/database/database.provider.dart';
import 'package:urgencias_oftamologicas/src/domain/patient/model/patient.model.dart';

class PatientRepository extends DBRepository<Patient> {
  PatientRepository() : super('patient_information', (json) => Patient.fromJson(json));
}