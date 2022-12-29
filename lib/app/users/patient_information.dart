
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urgencias_oftamologicas/app/models/patients.dart';
import '../../services/database.dart';
import  'package:intl/intl.dart';


class PatientInformation extends StatelessWidget {
  const PatientInformation({super.key}) ;


  /**
   * final String name;
      final String lastname;
      final String documentId;
      final String gender;
      final String socioeconomic;
      final String schooling;
      final String source;
      final DateTime birthdate;
      final Object age;*/

  Future<void> _inserData_User(BuildContext context) async{
    String cdate = DateFormat("yyyy-MM-dd").format(DateTime.now());
    final database = Provider.of<Database>(context, listen: false);
    await database.addPatient(
        Patients(
            name:'Guillermo',
            lastname: 'Hernandez',
            documentId: '94064730',
            gender: 'Masculino',
            socioeconomic: '3',
            schooling: 'Primaria',
            source: 'Rural',
            age:25,
            birthdate: cdate));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información del Paciente'),
      ),
      body: SingleChildScrollView(//Evita el desborde de pantalla
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: buildContent(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _inserData_User(context),
      ) ,
    );
  }
  Container buildContent(BuildContext context){

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, //en el eje y
        crossAxisAlignment: CrossAxisAlignment.stretch, //en el eje x
        children: <Widget>[
          SizedBox(height: 40.0),
          Text(
            'Por favor ingrese los datos del paciente',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 18.0,
                fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(height: 40.0),
        ],
      ),
    );
  }

}
