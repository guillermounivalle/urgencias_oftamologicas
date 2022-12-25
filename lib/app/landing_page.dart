

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:urgencias_oftamologicas/services/auth.dart';

import 'home_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key, required this.auth});
  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.active){
            final User? user = snapshot.data;
            if(user == null) {
              return HomePage(
                auth: auth,
                //onSignIn: _updateUser, Esta linea desaparece. Cambia en la clase SigninPage
              );
            }
            return HomePage(
              auth: auth,
              //onSignOut: () => {_updateUser(null)}, Esta linea desaparece
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
    );



  }
}