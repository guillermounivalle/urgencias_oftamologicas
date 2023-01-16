

import '../../blocs/common/base.view.model.dart';
import '../../blocs/infrastructure/auth/auth.service.dart';
import '../../blocs/infrastructure/auth/session.model.dart';
import '../../blocs/infrastructure/locator/service.locator.dart';
import '../../repository/services/auth.dart';

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
}