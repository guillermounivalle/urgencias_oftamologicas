import 'package:urgencias_oftamologicas/app/infrastructure/router.model.dart';

abstract class OFTViewModule {
  List<OFTViewModule> imports() {
    return [];
  }

  List<OFTRoute> routes();
}