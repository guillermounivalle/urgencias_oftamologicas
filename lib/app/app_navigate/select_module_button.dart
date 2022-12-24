import 'package:flutter/cupertino.dart';
import 'package:urgencias_oftamologicas/common_widgets/custom_button_select.dart';
import 'package:flutter/material.dart';
/**
 *
 * Creando un botón para hacer Sign in
 * */

class SelectModuleButton extends Custom_Button_Select {
  SelectModuleButton({//Creando el constructor de la clase
    //Se debe solicitar todos los argumentos de la clase original
    required String assetName,
    required String text,
    required Color color,
    required Color colorText,
    required double borderRadius,
    required VoidCallback onPressed,
  }): assert(text != null),  //assert detiene la ejecución si el booleano es false
        assert(assetName != null), //assert solo es para hacer debbug al código
        super(
          child: Column(
            children: <Widget>[
              Image.asset(assetName),
              Text(text, style: TextStyle(color: colorText, fontSize: 15.0)),
              Opacity(
                opacity: 0.0,
              ),//Este opacity permite acomodar centrado el texto sign in
            ],
          ),
          borderRadius: borderRadius,
          color: color,
          colorText: colorText,
          width: 170.0,
          height: 170.0, //Aqui le damos el valor a la altura, sino se lo damos, toma por defecto el seteado
          //en la clase Custom
          onPressed: onPressed
      );
}