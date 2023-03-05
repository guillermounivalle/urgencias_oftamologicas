import 'package:flutter/cupertino.dart';
import 'package:urgencias_oftamologicas/src/blocs/common/base.view.model.dart';
import 'package:urgencias_oftamologicas/src/blocs/infrastructure/locator/service.locator.dart';
import 'package:urgencias_oftamologicas/src/domain/patient_hospitalization/app/patienthospitalization.service.dart';
import 'package:urgencias_oftamologicas/src/domain/patient_hospitalization/model/patienthospitalization.model.dart';

class PatientHospitalizationViewModel extends BaseViewModel {
  final PatientHospitalizationService _service = serviceLocator<PatientHospitalizationService>();
  PatientHospitalization? _entity;

  PatientHospitalization get entity => _entity!;

  void loadRequired() {
    _entity = PatientHospitalization.createNew();
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