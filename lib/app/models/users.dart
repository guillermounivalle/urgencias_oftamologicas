

class UserData{
  UserData({
    required this.name,
    required this. lastname,
    required this.documentId,
    required this.email,
    required this.password,
    required this.speciality,
    required this.isadministrator,
    required this.isactive
  });
  final String name;
  final String lastname;
  final String documentId;
  final String email;
  final String password;
  final String speciality;
  final bool isadministrator;
  final bool isactive;

  Map<String, dynamic> toMap(){
    return{
      'name': name,
      'lastname': lastname,
      'documentId': documentId,
      'email': email,
      'password': password,
      'speciality': speciality,
      'isadministrator': isadministrator,
      'isactive': isactive
    };
  }

}