import 'package:flutter/cupertino.dart';
import 'package:urgencias_oftamologicas/src/blocs/common/base.view.model.dart';
import 'package:urgencias_oftamologicas/src/blocs/infrastructure/locator/service.locator.dart';
import 'package:urgencias_oftamologicas/src/domain/patient/app/patient.service.dart';
import 'package:urgencias_oftamologicas/src/domain/patient/model/patient.model.dart';

class PatientViewModel extends BaseViewModel {
  final PatientService _service = serviceLocator<PatientService>();
  Patient? _entity;

  Patient get entity => _entity!;

  void loadRequired() {
    _entity = Patient.createNew();
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