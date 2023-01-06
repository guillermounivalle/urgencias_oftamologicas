import 'package:urgencias_oftamologicas/app/infrastructure/ciat.module.dart';
import 'package:urgencias_oftamologicas/app/infrastructure/router.model.dart';
import 'package:urgencias_oftamologicas/app/users/menu_user_page.dart';

class MainModule extends CIATViewModule {
  @override
  List<CIATRoute> routes() {
    return [
      CIATRoute('home/user', (s) => (_) => MenuUserPage()),
    ];
  }

}