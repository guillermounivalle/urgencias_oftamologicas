
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urgencias_oftamologicas/services/auth.dart';

import '../../common_widgets/show_alert_dialog.dart';

class MenuAdminsPage extends StatelessWidget {
  const MenuAdminsPage({super.key, required this.auth}) ;
  final AuthBase auth;

  //Is not necesary make the Singleton Class
  //FirebaseAuth.instance is a static class
  Future<void> _signOut() async {
    try {
      await auth.signOut();
    }catch (e){
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await showAlertDialog(
        context,
        title: 'Logout',
        content: 'Are you sure that you want to logout?',
        defaultActionText: 'OK',
        cancelActionText: 'Cancel'
    );
    if (didRequestSignOut == true){
      _signOut();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Modulo Administrador'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.black87,
              ),
              child: new Text('Logout', style: TextStyle( fontSize: 18.0),),
              onPressed: _signOut,
            )
          ]
      ),
    );
  }
}
