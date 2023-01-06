import 'package:urgencias_oftamologicas/app/infrastructure/ciat.module.dart';
import 'package:urgencias_oftamologicas/app/infrastructure/router.model.dart';
import 'package:urgencias_oftamologicas/app/users/patient_information.dart';

class PatientModule extends CIATViewModule {
  @override
  List<CIATRoute> routes() {
    return [
      CIATRoute('patient', (s) => (_) => PatientInformation())
    ];
  }

}