import 'package:urgencias_oftamologicas/src/blocs/infrastructure_route/router.model.dart';

abstract class OFTViewModule {
  List<OFTViewModule> imports() {
    return [];
  }

  List<OFTRoute> routes();
}