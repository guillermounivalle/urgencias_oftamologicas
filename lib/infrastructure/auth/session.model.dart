import 'package:firebase_auth/firebase_auth.dart';
import 'package:urgencias_oftamologicas/infrastructure/auth/authentication.model.dart';

class OFTSession  {
  static User? _userSession;
  static StaffAuthorization? _authorization;

  static User? get currentSession => _userSession;
  static bool get isAdmin => _authorization!.isadministrator;

  static void setSession(User userSession, StaffAuthorization authorization) {
    _userSession = userSession;
    _authorization = authorization;
  }
}