import 'package:urgencias_oftamologicas/src/domain/patient_initial_evaluation/infrastructure/patientinitialevaluation.repository.dart';
import 'package:urgencias_oftamologicas/src/domain/patient_initial_evaluation/model/patientinitialevaluation.model.dart';

class PatientInitialEvaluationService {
  final PatientInitialEvaluationRepository _repository  = PatientInitialEvaluationRepository();

  Future<void> save(PatientInitialEvaluation patientInitialEvaluation) {
    return _repository.save(patientInitialEvaluation);
  }
}