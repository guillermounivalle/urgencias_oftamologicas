

class InitialEvaluation{
  /**
   * Definicón de parametros
   * patology ==> Patología (Traúmatica, No Traúmatica)
   * abnormal_fundus ==> Fondo de ojo anormal ( SI {OJO DERECHO, IZQUIERDO, AMBOS}, NO)
   * anterior_chamber_alterations ==> ALteración de la camara anterior ( SI {OJO DERECHO, IZQUIERDO, AMBOS}, NO)
   *blunt_trauma ==> Trauma Contuso ( SI {OJO DERECHO, IZQUIERDO, AMBOS}, NO)
   * */
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