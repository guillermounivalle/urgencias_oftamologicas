
import 'package:urgencias_oftamologicas/src/blocs/infrastructure/database/database.provider.dart';
import 'package:urgencias_oftamologicas/src/domain/patient_home/model/patienthome.model.dart';

class PatientHomeRepository extends DBRepository<PatientHome> {
  PatientHomeRepository() : super(
      'patient_at_home', (json) => PatientHome.fromJson(json));
}