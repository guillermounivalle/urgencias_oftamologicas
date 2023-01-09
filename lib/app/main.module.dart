import 'package:urgencias_oftamologicas/app/admins/menu_admin_page.dart';
import 'package:urgencias_oftamologicas/app/infrastructure/oft.module.dart';
import 'package:urgencias_oftamologicas/app/infrastructure/router.model.dart';
import 'package:urgencias_oftamologicas/app/users/menu_user_page.dart';

import 'app.signin/register_account_page.dart';
import 'app.signin/email_sign_in_page.dart';
import 'app.signin/reset_password.dart';
import 'home_page.dart';

class MainModule extends OFTViewModule {
  @override
  List<OFTRoute> routes() {
    return [
      OFTRoute('home/user', (s) => (_) => MenuUserPage()),
      OFTRoute('login', (s) => (_) => EmailSignPage()),
      OFTRoute('homepage', (s) => (_) => HomePage()),
      OFTRoute('home/admin', (s) => (_) => MenuAdminsPage()),
      OFTRoute('register_account', (s) => (_) => RegisterAccountPage()),
      OFTRoute('reset_password', (s) => (_) => ResetPassword()),
    ];
  }

}