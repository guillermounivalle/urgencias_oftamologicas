import 'package:flutter/material.dart';
import 'package:urgencias_oftamologicas/src/blocs/infrastructure_route/progress-dialog.widget.dart';
import 'package:urgencias_oftamologicas/src/blocs/infrastructure_route/router.model.dart';

import '../common/error.widget.dart';

class OFTRouter {
  static Route? currentRoute;
  List<OFTRoute> _appRoutes = [];
  final _errorBuilder = (_) => OFTErrorWidget.of("Ruta desconocida");

  Route<dynamic> generateRoute(RouteSettings settings) {
    final found = _appRoutes.where((it) => it.path == settings.name);
    WidgetBuilder builder = _errorBuilder;
    if (found.isNotEmpty) {
      builder = found.first.component(settings);
    }
    currentRoute = MaterialPageRoute(
      settings: settings,
      builder: (c) {
        return ProgressDialogWrapper(
          builder: builder,
        );
      },
    );
    return currentRoute!;
  }

  void addRoutes(List<OFTRoute> routes) {
    _appRoutes.addAll(routes);
  }
}