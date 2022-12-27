

import 'dart:js';

class Patients{
  Patients({
    required this.name,
    required this. lastname,
    required this.documentId,
    required this.gender,
    required this.socioeconomic,
    required this.schooling,
    required this.source,
    required this.birthdate,
    required this.age,
  });
  final String name;
  final String lastname;
  final String documentId;
  final String gender;
  final String socioeconomic;
  final String schooling;
  final String source;
  final DateTime birthdate;
  final JsObject age;

  Map<String, dynamic> toMap(){
    return{
      'name': name,
      'lastname': lastname,
      'documentId': documentId,
      'gender': gender,
      'socioeconomic': socioeconomic,
      'schooling': schooling,
      'schooling': schooling,
      'birthdate': birthdate,
      'age': age
    };
  }
}