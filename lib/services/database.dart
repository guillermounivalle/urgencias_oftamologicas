
import 'package:meta/meta.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../app/models/users.dart';
import 'api_path.dart';

abstract class Database {
  Future<void> addUser(UserData userData);
}

class FirestoresDatabase implements Database {
  //Constructor
  FirestoresDatabase({required this.uid}): assert(uid != null);
  final String uid;

  Future<void> addUser(UserData userData) async{ //Mapea el key values para poder ubicar el documento
    // collection/document/collection/document
    //el {ultimo documento es el que se va a ingresar
    final path = APIPath.addUser(uid); //el path que representa la locación del documento
    final documentReference = FirebaseFirestore.instance.doc(path); //Accedemos a Firebase Post instance
    await documentReference.set(userData.toMap());
  }
}
