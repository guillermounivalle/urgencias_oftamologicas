import 'package:flutter/cupertino.dart';
import 'package:urgencias_oftamologicas/src/blocs/common/base.view.model.dart';
import 'package:urgencias_oftamologicas/src/blocs/infrastructure/locator/service.locator.dart';
import 'package:urgencias_oftamologicas/src/domain/patient_surgery/app/patientsurgery.service.dart';
import 'package:urgencias_oftamologicas/src/domain/patient_surgery/model/patientsurgery.model.dart';


class PatientSurgeryViewModel extends BaseViewModel {
  final PatientSurgeryService _service = serviceLocator<PatientSurgeryService>();
  PatientSurgery? _entity;

  PatientSurgery get entity => _entity!;

  void loadRequired() {
    _entity = PatientSurgery.createNew();
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