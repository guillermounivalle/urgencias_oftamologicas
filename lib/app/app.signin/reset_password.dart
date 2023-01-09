
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urgencias_oftamologicas/app/app.signin/login.view.model.dart';
import 'package:urgencias_oftamologicas/services/auth.dart';
import '../../common_widgets/form_submit_button.dart';
import '../../styles/color.styles.dart';
import 'package:provider/provider.dart';
import '../validators/validators.dart';


class ResetPassword extends StatefulWidget with EmptyFieldValidators{ //mixin

  @override
  _ResetPassword createState()=> _ResetPassword();
}

class _ResetPassword extends State<ResetPassword> {

  final FocusNode _emailFocusNode = FocusNode(); // crear atributo en _builEmailTextField
  final TextEditingController _emailController = TextEditingController();
  final auth = FirebaseAuth.instance;
  bool _submitted = false;
  String get _email => _emailController.text;
  bool _isLoading = false;  // pasa a true mientras carga
  void _emailEditingComplete(){
  }

  TextField _buildEmailTextField() {
    bool showErrorText = _submitted && !widget.emailValidator.isValid(_email);
    return TextField(
      style: TextStyle(
          fontSize: 20.0,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w100,
          color: Colors.white
      ),
      controller: _emailController,
      focusNode: _emailFocusNode,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 0.5,
          ),
        ),
        enabled: _isLoading == false,
        labelText: 'Email',
        labelStyle: TextStyle(
            fontSize: 15.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w100,
            color: Colors.white
        ),
        errorText: showErrorText ? widget.invalidEmailErrorText : null,
      ),
      autocorrect: false,  // no trabaja el autocorrector
      keyboardType: TextInputType.emailAddress, //teclado para email
      textInputAction: TextInputAction.done, //Teclado salta a la siguiente linea
      onChanged: (email) => _updateState(),
      onEditingComplete: _emailEditingComplete,// cuando esté completo el campo, pasa a campos del password
    );
  }

  void _updateState() {
    setState(() {

    });
  }
  Future<void> _send_Request() async {
    try {
      await auth.sendPasswordResetEmail(email: _email);
      _emailController.clear();
      Navigator.of(context).pushNamedAndRemoveUntil(
          'homepage', (route) => false);
    } catch (err) {
      print('==> Error _send_Request ' + err.toString() );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(//==> Estructura visal del layout (AppBar, Body, FloatingActionBottom)
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(//Leer documentación
          backgroundColor: ColorStyles.appbarprimarycolor,//Title bar
          title: Text('Recuperar Contraseña'),
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
                  'Por favor ingrese cuenta de correo',
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
                    child: Column(
                      children: [
                        _buildEmailTextField(),
                        SizedBox(height: 10.0),
                        FormSumbitButton(
                          color: ColorStyles.buttonlogincolorprimary,
                          colorText: Colors.indigo,
                          text: 'Enviar petición',
                          onPressed: _send_Request
                        ),
                      ],
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
