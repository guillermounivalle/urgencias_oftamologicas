
class APIPath {
  String groupID = 'unique_id';
  static String addUser(String uid) => '/medicalstaff/$uid';
  static String addPatient() => '/patients/';
  static String addNewInitialEvaluation() => '/initial_evaluations/';
  static String addNewHospitalization() => '/hospitalization/';
  static String addNewSurgery() => '/surgery/';
  static String addNewPatientAtHome() => '/patient_at_home/';
}