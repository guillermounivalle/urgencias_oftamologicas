import 'package:get_it/get_it.dart';
import 'package:urgencias_oftamologicas/infrastructure/auth/auth.service.dart';
import 'package:urgencias_oftamologicas/services/auth.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // Infrastructure services
  serviceLocator.registerSingleton(AuthService());
  serviceLocator.registerSingleton(AuthorizationService());
}
