
import '../ui/admins/menu_admin_page.dart';
import '../ui/app.signin/email_sign_in_page.dart';
import '../ui/app.signin/register_account_page.dart';
import '../ui/app.signin/reset_password.dart';
import '../ui/home_page.dart';
import '../ui/users/menu_user_page.dart';
import 'infrastructure_route/oft.module.dart';
import 'infrastructure_route/router.model.dart';

class MainModule extends OFTViewModule {
  @override
  List<OFTRoute> routes() {
    return [
      OFTRoute('home/user', (s) => (_) => MenuUserPage()),
      OFTRoute('login', (s) => (_) => EmailSignPage()),
      OFTRoute('homepage', (s) => (_) => HomePage()),
      OFTRoute('home/admin', (s) => (_) => MenuAdminPage()),
      OFTRoute('register_account', (s) => (_) => RegisterAccountPage()),
      OFTRoute('reset_password', (s) => (_) => ResetPassword()),
    ];
  }

}