
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * Creando botones reutilizables
 *
 * */


class Custom_Button_Select extends StatelessWidget {

  //Custom_Button_Select_Module Método que será llamado en otras clases para crear
  //un botón
  Custom_Button_Select({// Creando el constructor de la clase
    required this.child,
    required this.color,
    required this.colorText,
    this.borderRadius: 2.0, //Toma este valor por defecto de no ser llamado
    this.height: 10.0,
    this.width: 10.0,
    required this.onPressed,
  }) : assert(borderRadius != null);

  //definiendo propiedades
  final Widget child;
  final Color color;
  final Color colorText;
  final double borderRadius;
  final double height;
  final double width;
  final VoidCallback? onPressed;



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:height,
      width: width,
      child: ElevatedButton(
        child: child,
        style: ElevatedButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(//Border radius button
                borderRadius: BorderRadius.all(
                    Radius.circular(borderRadius)
                )
            ),
            textStyle: TextStyle(
              color: colorText,
            )
        ),
        onPressed: onPressed,
        //onPressed is optional and is Null by default
      ),
    );
  }
}
