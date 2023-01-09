import 'package:urgencias_oftamologicas/common/base.view.model.dart';
import 'package:urgencias_oftamologicas/infrastructure/auth/auth.service.dart';
import 'package:urgencias_oftamologicas/infrastructure/auth/session.model.dart';
import 'package:urgencias_oftamologicas/infrastructure/locator/service.locator.dart';

import '../../services/auth.dart';

class RegisterAccountModel extends BaseViewModel {
  final AuthService _authService = serviceLocator<AuthService>();

  Future<void> createUser(String email, String password) async {
    var currentSession =await _authService.createUserWithEmailAndPassword(email, password);
    OFTSession.setSessionOnlyCreateAccount(currentSession!);
    notifyUI();
    notifyListeners();

    //
  }
}