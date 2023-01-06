import 'package:flutter/material.dart';

class ProgressDialogWrapper extends StatelessWidget {
  final WidgetBuilder builder;

  ProgressDialogWrapper({required this.builder});

  @override
  Widget build(BuildContext context) {
    return builder(context);
  }
}
