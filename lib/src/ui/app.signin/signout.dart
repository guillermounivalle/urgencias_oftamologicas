
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../repository/services/auth.dart';
import '../../repository/common_widgets/show_alert_dialog.dart';


//Is not necesary make the Singleton Class
//FirebaseAuth.instance is a static class
Future<void> signOut(BuildContext context) async {
  final auth = Provider.of<AuthBase>(context, listen: false);
  try {
    await auth.signOut();
    _navigateToHomePage(context);
  }catch (e){
    print(e.toString());
  }
}

void _navigateToHomePage(BuildContext context){
  Navigator.of(context).pushNamedAndRemoveUntil('homepage', (route) => false);
}

Future<void> confirmSignOut(BuildContext context) async {
  print('========> llama a signoutconfirm');
  final didRequestSignOut = await showAlertDialog(
      context,
      title: 'Logout',
      content: 'Está seguro de cerrar su sesión?',
      defaultActionText: 'OK',
      cancelActionText: 'Cancelar'
  );
  if (didRequestSignOut == true){
    signOut(context);
  }
}