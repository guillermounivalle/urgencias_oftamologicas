

import 'package:flutter/material.dart';
import 'package:urgencias_oftamologicas/app/app_navigate/select_module_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({ super.key} );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Urgencias Oftamológicas'),
          elevation: 10.0,  //Shadow bar. Crea un efecto sombra
      ),
      body: buildContent(),
    );
  }

  Container buildContent(){
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center, //en el eje y
        crossAxisAlignment: CrossAxisAlignment.stretch, //en el eje x
        children: <Widget>[
          SizedBox(height: 10.0),
          Text(
            'Seleccione el módulo al que desea ingresar',
                textAlign: TextAlign.center,
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 18.0,
              fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SelectModuleButton(
                assetName: 'images/google-logo.png',
                text: 'Usuario',
                colorText: Colors.black87,
                color: Colors.white,
                borderRadius: 8.0,
                onPressed: (){},
              ),
              SelectModuleButton(
                assetName: 'images/google-logo.png',
                text: 'Administrador',
                colorText: Colors.black87,
                color: Colors.white,
                borderRadius: 8.0,
                onPressed: (){},
              ),
            ],
          )
        ],
      ),
    );
  }

}
