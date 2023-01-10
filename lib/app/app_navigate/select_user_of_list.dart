import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urgencias_oftamologicas/common_widgets/custom_button_select.dart';
import 'package:flutter/material.dart';
/**
 *
 * Creando un botón para hacer Sign in
 * */

class SelectUserListButton extends Custom_Button_Select {
  SelectUserListButton({//Creando el constructor de la clase
    //Se debe solicitar todos los argumentos de la clase original
    required String assetName,
    required String assetName1,
    required String assetName2,
    required String text,
    required Color color,
    required Color colorText,
    required double borderRadius,
    required VoidCallback onPressed,
  }): assert(text != null),  //assert detiene la ejecución si el booleano es false
        assert(assetName != null), //assert solo es para hacer debbug al código
        super(
          child: Row(
            children: <Widget>[
              SizedBox(width: 10.0),
              SvgPicture.asset(
                assetName,
                color: Colors.white,
                width: 25.0,
                height: 25.0,
              ),
              SizedBox(width: 15.0),
              Text(
                  text,
                  style:
                  TextStyle(
                    color: colorText,
                    fontSize: 15.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w100,
                  )
              ),
              Expanded(child: SizedBox()),
              SvgPicture.asset(
                assetName1,
                color: Colors.white,
                width: 25.0,
                height: 25.0,
              ),
              SvgPicture.asset(
                alignment: Alignment.centerRight,
                assetName2,
                color: Colors.lightGreen,
                width: 25.0,
                height: 25.0,
              ),
              Opacity(
                opacity: 0.0,
              ),//Este opacity permite acomodar centrado el texto sign in
            ],
          ),
          borderRadius: borderRadius,
          color: color,
          colorText: colorText,
          height: 65.0, //Aqui le damos el valor a la altura, sino se lo damos, toma por defecto el seteado
          //en la clase Custom
          onPressed: onPressed
      );
}