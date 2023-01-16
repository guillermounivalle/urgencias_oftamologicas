
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../repository/styles/color.styles.dart';
import 'forms/email_sign_in_form.dart';
import 'package:provider/provider.dart';

import 'login.view.model.dart';

class EmailSignPage extends StatelessWidget {
  const EmailSignPage({ super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(//==> Estructura visal del layout (AppBar, Body, FloatingActionBottom)
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(//Leer documentación
          backgroundColor: ColorStyles.appbarprimarycolor,//Title bar
          centerTitle: true,
          title: Text(
            'LOGIN',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w100,
                fontSize: 17.0,
                color: Colors.white
            ),
          ),
        ),
      ),
      //Show intention Actions  using "Alt + Enter"
      body: ChangeNotifierProvider<LoginViewModel>(
        create: (_) => LoginViewModel(),
        child: SingleChildScrollView(//Evita el desborde de pantalla
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
            //mainAxisAlignment: MainAxisAlignment.center, //en el eje y
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 0),
                height: 200,
                child: Image.asset("images/logo-HU_Horizontal_blanco.png"),
              ),
              SizedBox(height: 10.0),
              Text(
                'Por favor ingrese sus datos',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w200,
                    //fontStyle: FontStyle.italic,
                    fontSize: 22.0,
                    color: Colors.white
                ),
              ),
              SizedBox(height: 20.0),
              SingleChildScrollView(//Evita el desborde de pantalla
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: EmailSignInForm(),
                ),
              ),
            ],
          ),
          ),
        ),

      ),
    );
  }
}
