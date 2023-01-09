import 'package:urgencias_oftamologicas/app/infrastructure/oft.module.dart';
import 'package:urgencias_oftamologicas/app/infrastructure/router.model.dart';
import 'package:urgencias_oftamologicas/app/users/patient_home.dart';
import 'package:urgencias_oftamologicas/app/users/patient_hospitalization.dart';
import 'package:urgencias_oftamologicas/app/users/patient_information.dart';
import 'package:urgencias_oftamologicas/app/users/initial_evaluation.dart';

import '../models/initial_evaluation.dart';

class UserModules extends OFTViewModule {
  @override
  List<OFTRoute> routes() {
    return [
      OFTRoute('patient_information', (s) => (_) => PatientInformation()),
      OFTRoute('initial_evaluation', (s) => (_) => InitialEvaluationPatient()),
      OFTRoute('patient_home', (s) => (_) => PatientHome()),
      OFTRoute('patient_hospitalizacion', (s) => (_) => PatientHospitalization()),
    ];
  }

}