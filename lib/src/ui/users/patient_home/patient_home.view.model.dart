import 'package:flutter/cupertino.dart';
import 'package:urgencias_oftamologicas/src/blocs/common/base.view.model.dart';
import 'package:urgencias_oftamologicas/src/blocs/infrastructure/locator/service.locator.dart';
import 'package:urgencias_oftamologicas/src/domain/patient_home/app/patienthome.service.dart';
import 'package:urgencias_oftamologicas/src/domain/patient_home/model/patienthome.model.dart';

class PatientHomeViewModel extends BaseViewModel {
  final PatientHomeService _service = serviceLocator<PatientHomeService>();

  PatientHome? _entity;

  PatientHome get entity => _entity!;

  void loadRequired() {
    _entity = PatientHome.createNew();
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