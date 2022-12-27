
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urgencias_oftamologicas/services/auth.dart';
import '../../common_widgets/show_alert_dialog.dart';


class PatientHome extends StatelessWidget {
  const PatientHome({super.key}) ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Paciente cuidados en casa'),
      ),
      body: SingleChildScrollView(//Evita el desborde de pantalla
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: buildContent(context),
        ),
      ),
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
            'Por favor ingrese los datos del paciente a recuperar en casa',
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
