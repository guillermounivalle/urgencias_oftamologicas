
/**
 * Se usa para mostrar mensajes de alerta
 * Los datos requeridos son:
 * - El titulo que lleva r{a el cuadro de mensaje de dialogo
 * - El contenido del mensaje
 * - El texto 'OK' que arrojara un booleano
 * - El texto Cancel que arrojara un booleano
 * */

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future showAlertDialog(
    BuildContext context, {
      required String title,
      required String content,
      required String defaultActionText,
      String? cancelActionText,
    }){
  if (!Platform.isIOS){
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            if(cancelActionText != null)
              TextButton(
                child: Text(cancelActionText),
                onPressed:  () => Navigator.of(context).pop(false),
              ),
            TextButton(
              child: Text(defaultActionText),
              onPressed:  () => Navigator.of(context).pop(true),
            ),
          ],
        )
    );
  }
  return showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          if(cancelActionText != null)
            CupertinoDialogAction(
              child: Text(cancelActionText),
              onPressed:  () => Navigator.of(context).pop(false),
            ),
          CupertinoDialogAction(
            child: Text(defaultActionText),
            onPressed:  () => Navigator.of(context).pop(true),
          ),
        ],
      )
  );
}