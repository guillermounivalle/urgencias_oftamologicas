
import '../../blocs/common/base.view.model.dart';
import '../../blocs/infrastructure/auth/session.model.dart';
import '../../blocs/infrastructure/locator/service.locator.dart';
import '../../blocs/services/auth.dart';

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