import 'package:urgencias_oftamologicas/src/domain/patient_surgery/infrastructure/patientsurgery.repository.dart';
import 'package:urgencias_oftamologicas/src/domain/patient_surgery/model/patientsurgery.model.dart';

class PatientSurgeryService {
  final PatientSurgeryRepository _repository = PatientSurgeryRepository();

  Future<void> save(PatientSurgery patientSurgery) {
    return _repository.save(patientSurgery);
  }
}