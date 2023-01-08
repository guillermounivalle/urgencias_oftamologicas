
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urgencias_oftamologicas/app/app.signin/login.view.model.dart';
import '../../styles/color.styles.dart';
import 'email_sign_in_form.dart';
import 'package:provider/provider.dart';

import 'signout.dart';

class RegisterAccountPage extends StatelessWidget {
  const RegisterAccountPage({ super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(//==> Estructura visal del layout (AppBar, Body, FloatingActionBottom)
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(//Leer documentación
          backgroundColor: ColorStyles.appbarprimarycolor,//Title bar
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
                  padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
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
                    child: Container(
                      child: TextButton(
                        child: Text(
                          'Navegar a HomePAge',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w200,
                              //fontStyle: FontStyle.italic,
                              fontSize: 16.0,
                              color: Colors.white
                          ),
                        ),
                        onPressed: () =>  Navigator.of(context).pushNamedAndRemoveUntil('homepage', (route) => false)

                      ),
                    ),
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
