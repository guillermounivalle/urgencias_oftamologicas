
import 'package:meta/meta.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:urgencias_oftamologicas/app/models/patients.dart';

import '../app/models/medical_staff.dart';
import 'api_path.dart';

abstract class Database {
  Future<void> addUser(MedicalStaff userData);
  Future<void> addPatient(Patients patients);
}

class FirestoresDatabase implements Database {
  //Constructor
  FirestoresDatabase({required this.uid}): assert(uid != null);
  final String uid;

  Future<void> addUser(MedicalStaff medicalStaff) async{ //Mapea el key values para poder ubicar el documento
    // collection/document/collection/document
    //el {ultimo documento es el que se va a ingresar
    final path = APIPath.addUser(uid); //el path que representa la locación del documento
    final documentReference = FirebaseFirestore.instance.doc(path); //Accedemos a Firebase Post instance
    await documentReference.set(medicalStaff.toMap());
  }

  Future<void> addPatient(Patients patients) async{ //Mapea el key values para poder ubicar el documento
    // collection/document/collection/document
    //el {ultimo documento es el que se va a ingresar
    final path = APIPath.addPatient(); //el path que representa la locación del documento
    final documentReference = FirebaseFirestore.instance.doc(path); //Accedemos a Firebase Post instance
    await documentReference.set(patients.toMap());
  }

}
