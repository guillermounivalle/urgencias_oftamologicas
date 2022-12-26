import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urgencias_oftamologicas/services/auth.dart';

import 'email_sign_in_page.dart';


class SignInPageOptions extends StatelessWidget {
  const SignInPageOptions({super.key, required this.auth}) ;
  final AuthBase auth; //Llamando la clase abstracta creada en auth.dart


  //Pasamos un BuildContext para poder hacer la navegación
  Future<void> _signInWithEmailAndPassword(BuildContext context) async {
    // TODO: Show EmailSignPage
    /**
     * Navigator.of(context).push(
        MaterialPageRoute<void>(
        fullscreenDialog: true,  //true muestra el diálogo para retornar
        builder: (context) => EmailSignPage(auth: auth, typeUser: typeUser),
        ),
        );*/
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
