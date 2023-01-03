
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:urgencias_oftamologicas/app/models/patients.dart';
import '../../common_widgets/form_submit_button.dart';
import '../../services/database.dart';
import  'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../app_navigate/button_options_insert_data.dart';
import '../app_navigate/select_module_button.dart';


class PatientInformation extends StatelessWidget {
   PatientInformation({super.key}) ;

  final List<String> genero =<String> [ 'Seleccionar','Masculino', 'Femenino', 'Otro'];
  final List<String> escolaridad =<String> [ 'Seleccionar','Primaria', 'Secundaria', 'Pre-Grado', 'Post-Grado'];
  final List<String> procedencia =<String> [ 'Seleccionar','Urbana', 'Rural'];
  final List<String> estrato =<String> [ 'Seleccionar','1', '2', '3', '4', '5', '6', '+6'];
  DateTime date = DateTime.now();
  String formatdate = DateFormat("yyyy-MM-dd").format(DateTime.now());
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
    final database = Provider.of<FirestoresDatabase>(context, listen: false);
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
  Future<void> _ShowCalendar(BuildContext context) async{
    DateTime? newDate = await showDatePicker(
        context: context,
        locale: const Locale("es", "LA~C"),
        initialDate: date,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
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
      /**
       * floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _inserData_User(context),
          ) ,*/
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
          Container(
            color: Colors.white10,
            child: Row(
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
          ),
          SizedBox(height: 20.0),
          Container(
            color: Colors.white10,
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Nombres del Paciente',
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            color: Colors.white10,
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Apellidos del Paciente',
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            color: Colors.white10,
            child: Row(
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
                    onPressed: () => _ShowCalendar(context),
                  ),
                ]
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            color: Colors.white10,
            child: Row(
                children:<Widget>[
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Genero',
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    width: 250.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.blue,
                            width: 2)
                      ),
                      child: DropdownButton<String>(
                        value: genero.first,
                        borderRadius: BorderRadius.circular(5),
                        dropdownColor: Colors.white, //dropdown background color
                        underline: SizedBox(), //remove underline
                        isExpanded: true, //make true to make width 100%
                        icon: const Icon(Icons.arrow_drop_down),
                        iconEnabledColor: Colors.blueAccent,
                        elevation: 16,
                        style: const TextStyle(color: Colors.blueAccent),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          print("dndndndndn");
                          //setState(() {
                          //dropdownValue = value!;
                          //});
                        },
                        items: genero.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            alignment: Alignment.centerLeft,
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )
                  )
                ]
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            color: Colors.white10,
            child: Row(
                children:<Widget>[
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Escolaridad',
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      width: 250.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blue,
                          width: 2)
                      ),
                      child: DropdownButton<String>(
                        value: escolaridad.first,
                        borderRadius: BorderRadius.circular(5),
                        dropdownColor: Colors.white, //dropdown background color
                        underline: SizedBox(), //remove underline
                        isExpanded: true, //make true to make width 100%
                        icon: const Icon(Icons.arrow_drop_down),
                        iconEnabledColor: Colors.blueAccent,
                        elevation: 16,
                        style: const TextStyle(color: Colors.blueAccent),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          print("dndndndndn");
                          //setState(() {
                          //dropdownValue = value!;
                          //});
                        },
                        items: escolaridad.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            alignment: Alignment.centerLeft,
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )
                  )
                ]
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            color: Colors.white10,
            child: Row(
                children:<Widget>[
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Procedencia',
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      width: 250.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blue,
                              width: 2)
                      ),
                      child: DropdownButton<String>(
                        value: procedencia.first,
                        borderRadius: BorderRadius.circular(5),
                        dropdownColor: Colors.white, //dropdown background color
                        underline: SizedBox(), //remove underline
                        isExpanded: true, //make true to make width 100%
                        icon: const Icon(Icons.arrow_drop_down),
                        iconEnabledColor: Colors.blueAccent,
                        elevation: 16,
                        style: const TextStyle(color: Colors.blueAccent),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          print("dndndndndn");
                          //setState(() {
                          //dropdownValue = value!;
                          //});
                        },
                        items: procedencia.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            alignment: Alignment.centerLeft,
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )
                  )
                ]
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            color: Colors.white10,
            child: Row(
                children:<Widget>[
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Estrato',
                      ),
                        enabled: false,
                        initialValue: '2'
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      width: 250.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blue,
                              width: 2)
                      ),
                      child: DropdownButton<String>(
                        value: estrato.first,
                        borderRadius: BorderRadius.circular(5),
                        dropdownColor: Colors.white, //dropdown background color
                        underline: SizedBox(), //remove underline
                        isExpanded: true, //make true to make width 100%
                        icon: const Icon(Icons.arrow_drop_down),
                        iconEnabledColor: Colors.blueAccent,
                        elevation: 16,
                        style: const TextStyle(color: Colors.blueAccent),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          print("dndndndndn");
                          //setState(() {
                          //dropdownValue = value!;
                          //});
                        },
                        items: estrato.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            alignment: Alignment.centerLeft,
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )
                  )
                ]
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            color: Colors.white10,
            child: Row(
                children:<Widget>[
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Fecha De Consulta',
                      ),
                      enabled: false,
                      initialValue: '1999-02-01',
                    ),
                  ),
                  ButtonOptionsInsertData(
                    assetName: 'images/calendar.png',
                    text: '',
                    colorText: Colors.black87,
                    color: Colors.white,
                    borderRadius: 6.0,
                    onPressed: () => _ShowCalendar(context),
                  ),
                ]
            ),
            ),
          SizedBox(height: 20.0),
          FormSumbitButton(
            color: Colors.blue,
            colorText: Colors.black87,
            text: 'Agregar Paciente',
            onPressed: null,
          ),
        ],
      ),
    );
  }

}


