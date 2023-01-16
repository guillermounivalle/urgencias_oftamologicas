
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * Creando botones reutilizables
 *
 * */


class CustomImageButtonSelect extends StatelessWidget {

  //Custom_Button_Select_Module Método que será llamado en otras clases para crear
  //un botón
  CustomImageButtonSelect({// Creando el constructor de la clase
    this.borderRadius: 1.0, //Toma este valor por defecto de no ser llamado
    this.height: 10.0,
    this.width: 10.0,
    this.text: "",
    required this.assetName,
    required this.onPressed,
  }) : assert(borderRadius != null);

  //definiendo propiedades
  final String assetName;
  final String text;
  final double borderRadius;
  final double height;
  final double width;
  final VoidCallback? onPressed;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: onPressed,
          child: Ink.image(
            image: AssetImage(assetName),
            height: height,
            width: width,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  //fontStyle: FontStyle.italic,
                  fontSize: 22.0,
                  color: Colors.white
              ),
            )

          ),
        )
      ],
    );

  }
}
