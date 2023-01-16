import 'package:firebase_auth/firebase_auth.dart';
import 'authentication.model.dart';

class OFTSession  {
  static User? _userSession;
  static StaffAuthorization? _authorization;

  static User? get currentSession => _userSession;
  static bool get isAdmin => _authorization!.isadministrator;

  static void setSession(User userSession, StaffAuthorization authorization) {
    _userSession = userSession;
    _authorization = authorization;
  }
  static void setSessionOnlyCreateAccount(User userSession) {
    _userSession = userSession;
  }
}