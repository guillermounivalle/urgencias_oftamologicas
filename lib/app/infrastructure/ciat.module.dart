import 'package:urgencias_oftamologicas/app/infrastructure/router.model.dart';

abstract class CIATViewModule {
  List<CIATViewModule> imports() {
    return [];
  }

  List<CIATRoute> routes();
}