
/**
import 'package:flutter/material.dart';

class Custom_Image_Container extends StatelessWidget {

  Custom_Image_Container({
    required this.asset,
    required this.child,
    this.borderRadius: 2.0, //Toma este valor por defecto de no ser llamado
    this.height: 10.0,
    this.width: 10.0,
  }) : assert(borderRadius != null);

  //definiendo propiedades
  final String asset;
  final Widget child;
  final double borderRadius;
  final double height;
  final double width;



   * @override
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
 */