import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:urgencias_oftamologicas/common/failure.model.dart';

enum NotifierState { initial, loading, loaded }

abstract class
BaseViewModel extends ChangeNotifier {
  NotifierState _state = NotifierState.initial;
  Failure? _failure;

  NotifierState get state => _state;

  Failure? get failure => _failure;

  bool get hasError => failure != null;

  void _setState(NotifierState state) {
    _state = state;
    notifyUI();
  }

  void notifyUI() {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  void loadStarted() {
    _setState(NotifierState.loading);
  }

  void loadEnded() {
    _setState(NotifierState.loaded);
  }

  void setFailure(Failure failure) {
    _failure = failure;
    notifyUI();
  }

  Future<void> run(Function body) async {
    try {
      loadStarted();
      await body.call();
    } on Exception catch (e) {
      setFailure(Failure.ofException(e));
    } finally {
      loadEnded();
    }
  }
}
