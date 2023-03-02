import 'package:urgencias_oftamologicas/src/blocs/infrastructure/database/database.provider.dart';
import 'package:urgencias_oftamologicas/src/domain/patient_initial_evaluation//model/patient_initial_evaluation.model.dart';


class PatientInitialEvaluationRepository extends DBRepository<PatientInitialEvaluation> {
  PatientInitialEvaluationRepository() : super(
      'initial_evaluation', (json) => PatientInitialEvaluation.fromJson(json));
}