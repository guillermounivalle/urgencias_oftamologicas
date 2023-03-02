import 'package:urgencias_oftamologicas/src/domain/patient_initial_evaluation/infrastructure/patient_initial_evaluation.repository.dart';
import 'package:urgencias_oftamologicas/src/domain/patient_initial_evaluation/model/patient_initial_evaluation.model.dart';

class PatientInitialEvaluationService {
  final PatientInitialEvaluationRepository _repository  = PatientInitialEvaluationRepository();

  Future<void> save(PatientInitialEvaluation patientinitialevaluation) {
    return _repository.save(patientinitialevaluation);
  }
}