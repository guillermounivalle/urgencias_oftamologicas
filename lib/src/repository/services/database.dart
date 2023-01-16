import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../blocs/infrastructure/auth/session.model.dart';
import '../../data/models/medical_staff.dart';
import '../../data/models/patients.dart';
import 'api_path.dart';

abstract class Database  {
  Future<void> addUser(MedicalStaff userData);
  Future<void> addPatient(Patients patients);
}

class FirestoresDatabase extends ChangeNotifier implements Database {
  //Constructor
  FirestoresDatabase({this.uid: ''}): assert(uid != null);
  final String uid;

  Future<void> addUser(MedicalStaff medicalStaff) async{ //Mapea el key values para poder ubicar el documento
    String uuid = await OFTSession.currentSession!.uid;
    final path = APIPath.addUser(uuid); //el path que representa la locación del documento
    final documentReference = FirebaseFirestore.instance.doc(path); //Accedemos a Firebase Post instance
    await documentReference.set(medicalStaff.toMap());
  }

  Future<void> addPatient(Patients patients) async{ //Mapea el key values para poder ubicar el documento
    String groupID = 'unique_id';
    // collection/document/collection/document
    //el {ultimo documento es el que se va a ingresar
    final path = APIPath.addPatient(); //el path que representa la locación del documento
    final documentReference = FirebaseFirestore.instance.collection('patients').doc(); //Accedemos a Firebase Post instance
    await documentReference.set(patients.toMap());
  }

}
