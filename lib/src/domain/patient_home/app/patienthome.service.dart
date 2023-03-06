import 'package:urgencias_oftamologicas/src/domain/patient_home/infrastructure/patienthome.repository.dart';
import 'package:urgencias_oftamologicas/src/domain/patient_home/model/patienthome.model.dart';

class PatientHomeService {
  final PatientHomeRepository _repository = PatientHomeRepository();

  Future<void> save(PatientHome patientHome) {
    return _repository.save(patientHome);
  }
}