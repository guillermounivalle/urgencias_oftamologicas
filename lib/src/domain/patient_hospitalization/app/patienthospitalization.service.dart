import 'package:urgencias_oftamologicas/src/domain/patient_hospitalization/infrastructure/patienthospitalization.repository.dart';
import 'package:urgencias_oftamologicas/src/domain/patient_hospitalization/model/patienthospitalization.model.dart';

class PatientHospitalizationService {
  final PatientHospitalizationRepository _repository = PatientHospitalizationRepository();

  Future<void> save(PatientHospitalization patientHospitalization) {
    return _repository.save(patientHospitalization);
  }
}