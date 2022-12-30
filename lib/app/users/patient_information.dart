
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:urgencias_oftamologicas/app/models/patients.dart';
import '../../services/database.dart';
import  'package:intl/intl.dart';

import '../app_navigate/button_options_insert_data.dart';
import '../app_navigate/select_module_button.dart';


class PatientInformation extends StatelessWidget {
   PatientInformation({super.key}) ;

  String cdate = DateFormat("yyyy-MM-dd").format(DateTime.now());
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
  void _ShowCalendar(){

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
          child: _buildContent(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _inserData_User(context),
      ) ,
    );
  }
  Container _buildContent(BuildContext context){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, //en el eje y
        crossAxisAlignment: CrossAxisAlignment.stretch, //en el eje x
        children: <Widget>[
          SizedBox(height: 40.0),
          Text(
            'Por favor ingres los datos del paciente a Valorar',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 18.0,
                fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            children:<Widget>[
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Documento de Identidad',
                  ),
                  keyboardType: TextInputType.number
                ),
              ),
              ButtonOptionsInsertData(
                assetName: 'images/find.jpg',
                text: '',
                colorText: Colors.black87,
                color: Colors.white,
                borderRadius: 6.0,
                onPressed: () {},
              ),
            ]
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Nombres del Paciente',
            ),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Apellidos del Paciente',
            ),
          ),
          SizedBox(height: 20.0),
          Row(
              children:<Widget>[
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Fecha Nacimiento',
                    ),
                  ),
                ),
                ButtonOptionsInsertData(
                  assetName: 'images/calendar.png',
                  text: '',
                  colorText: Colors.black87,
                  color: Colors.white,
                  borderRadius: 6.0,
                  onPressed: () => _ShowCalendar(),
                ),
              ]
          ),
        ],
      ),
    );
  }

}
