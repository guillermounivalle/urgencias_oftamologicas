import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_button_select.dart';

class FormSumbitButton extends Custom_Button_Select{
  FormSumbitButton({
    required String text,
    required Color colorText,
    required Color color,
    required VoidCallback? onPressed,
  }) : assert(text != null),
        super(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          color: color,
          colorText: colorText,
          width: 350,
          height: 70.0, //Aqui le damos el valor a la altura, sino se lo damos, toma por defecto el seteado
          //en la clase Custom
          onPressed: onPressed
      );

}