import 'package:flutter/material.dart';

class OFTErrorWidget extends StatelessWidget {
  final String _message;
  Function? _retryAction;

  OFTErrorWidget(this._message, this._retryAction);

  OFTErrorWidget.of(this._message);

  @override
  Widget build(BuildContext context) {
    final columnChildren = <Widget>[
      Icon(Icons.warning, size: 42),
      Center(child: Text('Ocurrió un error inesperado.')),
      Center(child: Text(_message)),
    ];
    if (_retryAction != null) {
      columnChildren.add(ElevatedButton(
        child: Text('Reintentar'),
        onPressed: () {
          _retryAction!();
        },
      ));
    }
    final column = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: columnChildren,
    );
    return column;
  }
}