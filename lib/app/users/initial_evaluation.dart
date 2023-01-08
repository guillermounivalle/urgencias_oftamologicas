
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urgencias_oftamologicas/app/models/initial_evaluation.dart';
import 'package:urgencias_oftamologicas/services/auth.dart';
import '../../common_widgets/show_alert_dialog.dart';
import '../app_navigate/select_module_button.dart';

class InitialEvaluationPatient extends StatefulWidget {
  const InitialEvaluationPatient({super.key}) ;

  @override
  State<InitialEvaluationPatient> createState() => _InitialEvaluationPatientState();
}

class _InitialEvaluationPatientState extends State<InitialEvaluationPatient>{
  final List<String> ojo_afectado = <String>['Seleccionar','Izquierdo','Derecho','Ambos' ];
  final List<String> patologia = <String>['Seleccionar','Izquierdo','Derecho','Ambos' ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Evaluación Inicial'),
        ),
        body: SingleChildScrollView( //Evita el desborde de pantalla
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: _buildContent(context),
          ),
        ),
    );
  }


  Container _buildContent(BuildContext context){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, //en el eje y
        crossAxisAlignment: CrossAxisAlignment.stretch, //en el eje x
        children: <Widget>[
          SizedBox(height: 30.0),
          Text(
            'Evaluación Inicial del Paciente',
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
            child: TextFormField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Documento de Identidad',
                ),
                initialValue: '29114523',
                keyboardType: TextInputType.number
            ),
          ),
          SizedBox(height: 20.0),
          SizedBox(height: 20.0),
          Container(
            color: Colors.white10,
            child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Patología',
                        ),
                        //initialValue: 'Traumática'
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      width: 200.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.blue,
                              width: 2)
                      ),
                      child: DropdownButton<String>(
                        value: patologia.first,
                        borderRadius: BorderRadius.circular(5),
                        dropdownColor: Colors.white,
                        //dropdown background color
                        underline: SizedBox(),
                        //remove underline
                        isExpanded: true,
                        //make true to make width 100%
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
                        items: patologia.map<DropdownMenuItem<String>>((
                            String value) {
                          return DropdownMenuItem<String>(
                            alignment: Alignment.centerLeft,
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )
                  ),
                ]
            ),
          ),
          SizedBox(height: 40.0),
          Text(
            'Motivo de Consulta',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 18.0,
                fontWeight: FontWeight.w600
            ),
          ),
        ],
      ),
    );
  }

}
