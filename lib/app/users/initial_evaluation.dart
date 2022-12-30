
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urgencias_oftamologicas/services/auth.dart';
import '../../common_widgets/show_alert_dialog.dart';
import '../app_navigate/select_module_button.dart';

class InitialEvaluation extends StatelessWidget {
  const InitialEvaluation({super.key}) ;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Admisión Paciente'),
      ),
      body: buildContent(context)
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
            'Por favor ingrese la informaciòn del paciente',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 18.0,
                fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(height: 20.0),

        ],
      ),
    );
  }

}
