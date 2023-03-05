
import 'package:urgencias_oftamologicas/src/ui/users/patient_home.dart';
import 'package:urgencias_oftamologicas/src/ui/users/patient_hospitalization/patient_hospitalization.main.dart';
import 'package:urgencias_oftamologicas/src/ui/users/patient_information/patient_information.main.dart';
import 'package:urgencias_oftamologicas/src/ui/users/patient_initial_evaluation/patientinitialevaluation.main.dart';
import 'package:urgencias_oftamologicas/src/ui/users/patient_surgery/patient_surgery.main.dart';
import '../../blocs/infrastructure_route/oft.module.dart';
import '../../blocs/infrastructure_route/router.model.dart';

class UserModules extends OFTViewModule {
  @override
  List<OFTRoute> routes() {
    return [
      OFTRoute('patient_information', (s) => (_) => PatientInformationFormView()),
      OFTRoute('initial_evaluation', (s) => (_) => PatientInitialEvaluationFormView()),
      OFTRoute('patient_home', (s) => (_) => PatientHome()),
      OFTRoute('patient_hospitalizacion', (s) => (_) => PatientHospitalizationFormView()),
      OFTRoute('patient_surgery', (s) => (_) => PatientSurgeryFormView()),
    ];
  }

}