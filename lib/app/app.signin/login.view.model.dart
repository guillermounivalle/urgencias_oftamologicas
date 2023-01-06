import 'package:urgencias_oftamologicas/common/base.view.model.dart';
import 'package:urgencias_oftamologicas/infrastructure/auth/auth.service.dart';
import 'package:urgencias_oftamologicas/infrastructure/auth/session.model.dart';
import 'package:urgencias_oftamologicas/infrastructure/locator/service.locator.dart';

import '../../services/auth.dart';

class LoginViewModel extends BaseViewModel {
  final AuthService _authService = serviceLocator<AuthService>();
  final AuthorizationService _authorizationService = serviceLocator<AuthorizationService>();

  Future<void> signIn(String email, String password) async {
    var currentSession = await _authService.signInWithEmailAndPassword(email, password);
    var authorizationSession = await _authorizationService.authorizationFor( currentSession!.uid );
    OFTSession.setSession(currentSession, authorizationSession);
    notifyUI();
    notifyListeners();
  }

  Future<void> createUser(String email, String password) async {
    var currentSession = await _authService.createUserWithEmailAndPassword(email, password);
    var authorizationSession = await _authorizationService.authorizationFor( currentSession!.uid );
    OFTSession.setSession(currentSession, authorizationSession);
    notifyUI();
    notifyListeners();
  }
}