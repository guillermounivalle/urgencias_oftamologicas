import 'package:urgencias_oftamologicas/app/admins/menu_admin_page.dart';
import 'package:urgencias_oftamologicas/app/infrastructure/ciat.module.dart';
import 'package:urgencias_oftamologicas/app/infrastructure/router.model.dart';
import 'package:urgencias_oftamologicas/app/users/menu_user_page.dart';

import 'app.signin/email_sign_in_page.dart';
import 'home_page.dart';

class MainModule extends CIATViewModule {
  @override
  List<CIATRoute> routes() {
    return [
      CIATRoute('home/user', (s) => (_) => MenuUserPage()),
      CIATRoute('login', (s) => (_) => EmailSignPage()),
      CIATRoute('homepage', (s) => (_) => HomePage()),
      CIATRoute('home/admin', (s) => (_) => MenuAdminsPage()),
    ];
  }

}