import 'package:urgencias_oftamologicas/src/blocs/infrastructure/database/database.provider.dart';
import 'package:urgencias_oftamologicas/src/domain/patient_surgery/model/patientsurgery.model.dart';

class PatientSurgeryRepository extends DBRepository<PatientSurgery> {
  PatientSurgeryRepository() : super(
      'patient_surgery', (json) => PatientSurgery.fromJson(json));
}