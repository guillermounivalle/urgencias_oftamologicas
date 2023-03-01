
import 'package:urgencias_oftamologicas/src/ui/users/patient_home.dart';
import 'package:urgencias_oftamologicas/src/ui/users/patient_hospitalization.dart';
import 'package:urgencias_oftamologicas/src/ui/users/patient_information/patient_information.main.dart';
import '../../blocs/infrastructure_route/oft.module.dart';
import '../../blocs/infrastructure_route/router.model.dart';
import 'initial_evaluation.dart';


class UserModules extends OFTViewModule {
  @override
  List<OFTRoute> routes() {
    return [
      OFTRoute('patient_information', (s) => (_) => PatientInformationFormView()),
      OFTRoute('initial_evaluation', (s) => (_) => InitialEvaluationPatient()),
      OFTRoute('patient_home', (s) => (_) => PatientHome()),
      OFTRoute('patient_hospitalizacion', (s) => (_) => PatientHospitalization()),
    ];
  }

}