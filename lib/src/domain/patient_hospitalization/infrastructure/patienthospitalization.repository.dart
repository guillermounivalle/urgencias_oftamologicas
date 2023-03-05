import 'package:urgencias_oftamologicas/src/blocs/infrastructure/database/database.provider.dart';
import 'package:urgencias_oftamologicas/src/domain/patient_hospitalization/model/patienthospitalization.model.dart';

class PatientHospitalizationRepository extends DBRepository<PatientHospitalization> {
  PatientHospitalizationRepository() : super(
      'patients_hospitalization', (json) => PatientHospitalization.fromJson(json));
}