import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'base.view.model.dart';
import 'error.widget.dart';

class ViewModelConsumer<T extends BaseViewModel> extends StatelessWidget {
  final Widget Function(BuildContext context, T value, Widget? child) builder;

  ViewModelConsumer({required this.builder});

  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: (context, model, child) {
        switch (model.state) {
          case NotifierState.loading:
            return Center(child: CircularProgressIndicator());
          case NotifierState.loaded:
          default:
            if (model.hasError) {
              return OFTErrorWidget.of(model.failure.toString());
            }
            return builder(context, model, child);
        }
      },
    );
  }
}