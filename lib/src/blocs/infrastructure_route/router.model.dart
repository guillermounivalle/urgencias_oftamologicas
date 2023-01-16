import 'package:flutter/material.dart';

typedef WidgetFactory = WidgetBuilder Function(RouteSettings settings);

class OFTRoute {
  String path;
  WidgetFactory component;

  OFTRoute(this.path, this.component);
}