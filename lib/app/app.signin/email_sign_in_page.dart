
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urgencias_oftamologicas/services/auth.dart';
import 'email_sign_in_form.dart';

class EmailSignPage extends StatelessWidget {
  const EmailSignPage({ super.key, required this.auth, required String typeUser});
  final AuthBase auth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(//==> Estructura visal del layout (AppBar, Body, FloatingActionBottom)
      appBar:AppBar(//Leer documentación
          title: Text('Sign In'), //Title bar
          elevation: 10.0  //Shadow bar. Crea un efecto sombra
      ),
      //Show intention Actions  using "Alt + Enter"
      body: SingleChildScrollView(//Evita el desborde de pantalla
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
              child: EmailSignInForm(auth: auth, )),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
