

import 'package:flutter/material.dart';
import 'package:urgencias_oftamologicas/services/auth.dart';

class MenuUserPage extends StatelessWidget {
  const MenuUserPage({super.key, required this.auth}) ;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Modulos'),
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
