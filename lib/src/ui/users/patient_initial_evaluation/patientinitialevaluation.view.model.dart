import 'package:flutter/cupertino.dart';
import 'package:urgencias_oftamologicas/src/blocs/common/base.view.model.dart';
import 'package:urgencias_oftamologicas/src/blocs/infrastructure/locator/service.locator.dart';
import 'package:urgencias_oftamologicas/src/domain/patient/app/patient.service.dart';
import 'package:urgencias_oftamologicas/src/domain/patient/model/patient.model.dart';

import '../../../domain/patient_initial_evaluation/app/patientinitialevaluation.service.dart';
import '../../../domain/patient_initial_evaluation/model/patientinitialevaluation.model.dart';

class PatientInitialEvaluationViewModel extends BaseViewModel {
  final PatientInitialEvaluationService _service = serviceLocator<PatientInitialEvaluationService>();
  PatientInitialEvaluation? _entity;

  PatientInitialEvaluation get entity => _entity!;

  void loadRequired() {
    _entity = PatientInitialEvaluation.createNew();
    notifyUI();
    notifyListeners();
  }

  Future<void> save(BuildContext context) async {
    loadStarted();
    await _service.save(entity);
    loadEnded();
    notifyUI();
    notifyListeners();
  }
}