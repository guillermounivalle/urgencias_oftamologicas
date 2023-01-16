import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../repository/common_widgets/custom_button_select.dart';
/**
 *
 * Creando un botón para hacer Sign in
 * */

class ButtonOptionsInsertData extends Custom_Button_Select {
  ButtonOptionsInsertData({//Creando el constructor de la clase
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
          child: Image.asset(assetName),
          borderRadius: borderRadius,
          color: color,
          colorText: colorText,
          width: 55.0,
          height: 55.0, //Aqui le damos el valor a la altura, sino se lo damos, toma por defecto el seteado
          //en la clase Custom
          onPressed: onPressed
      );
}