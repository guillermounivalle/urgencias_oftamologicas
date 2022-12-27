

class InitialEvaluation{
  InitialEvaluation({
    required this.patology,
    required this. abnormal_fundus,
    required this.anterior_chamber_alterations,
    required this.blunt_trauma,
    required this.socioeconomic,//Continuar aqui
    required this.schooling,
    required this.source,
    required this.birthdate,
    required this.age,
  });
  final String patology;
  final Object abnormal_fundus;
  final Object anterior_chamber_alterations;
  final Object blunt_trauma;
  final String socioeconomic;
  final String schooling;
  final String source;
  final DateTime birthdate;
  final Map<String, dynamic> age;

  Map<String, dynamic> toMap(){
    return{
      'patology': patology,
      'abnormal_fundus': abnormal_fundus,
      'anterior_chamber_alterations': anterior_chamber_alterations,
      'blunt_trauma': blunt_trauma,
      'socioeconomic': socioeconomic,
      'schooling': schooling,
      'schooling': schooling,
      'birthdate': birthdate,
      'age': age
    };
  }
}