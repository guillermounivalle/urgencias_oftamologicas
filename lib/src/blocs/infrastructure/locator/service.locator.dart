import 'package:get_it/get_it.dart';
import '../../../repository/services/auth.dart';
import '../auth/auth.service.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // Infrastructure services
  serviceLocator.registerSingleton(AuthService());
  serviceLocator.registerSingleton(AuthorizationService());
}