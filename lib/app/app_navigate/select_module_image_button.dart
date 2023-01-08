import 'package:flutter/cupertino.dart';
import 'package:urgencias_oftamologicas/common_widgets/custom_button_select.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/custom_image_button_container.dart';
/**
 *
 * Creando un botón para hacer Sign in
 * */

class SelectModuleImageButton extends CustomImageButtonSelect {
  SelectModuleImageButton({//Creando el constructor de la clase
    //Se debe solicitar todos los argumentos de la clase original
    required String assetName,
    required String text,
    //required Color colorText,
    required VoidCallback onPressed,
  }): assert(text != null),  //assert detiene la ejecución si el booleano es false
        assert(assetName != null), //assert solo es para hacer debbug al código
        super(
          assetName: assetName,
          onPressed: onPressed,
          text: text,
          width: 500.0,
          height: 200.0,
      );
}