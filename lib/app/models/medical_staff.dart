

class MedicalStaff{
  MedicalStaff({
    required this.name,
    required this. lastname,
    required this.documentId,
    required this.email,
    required this.isadministrator,
    required this.isactive
  });
  final String name;
  final String lastname;
  final String documentId;
  final String email;
  final bool isadministrator;
  final bool isactive;

  Map<String, dynamic> toMap(){
    return{
      'name': name,
      'lastname': lastname,
      'documentId': documentId,
      'email': email,
      'isadministrator': isadministrator,
      'isactive': isactive
    };
  }
}