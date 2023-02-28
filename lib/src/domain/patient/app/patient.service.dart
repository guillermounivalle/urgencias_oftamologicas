import 'package:urgencias_oftamologicas/src/domain/patient/infrastructure/patient.repository.dart';
import 'package:urgencias_oftamologicas/src/domain/patient/model/patient.model.dart';

class PatientService {
  final PatientRepository _repository = PatientRepository();

  Future<void> save(Patient patient) {
    return _repository.save(patient);
  }
}