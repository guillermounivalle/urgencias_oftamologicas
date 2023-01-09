
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urgencias_oftamologicas/app/validators/validators.dart';
import 'package:urgencias_oftamologicas/services/auth.dart';
import 'package:urgencias_oftamologicas/styles/color.styles.dart';
import '../../../common_widgets/form_submit_button.dart';
import '../../../common_widgets/show_alert_dialog.dart';
import '../../../infrastructure/auth/session.model.dart';
import '../login.view.model.dart';

enum EmailSignInFormType {signIn, register }

class EmailSignInForm extends StatefulWidget with EmptyFieldValidators{ //mixin

  @override
  _EmailSignInFormState createState()=> _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordControler = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode(); // crear atributo en _builEmailTextField
  final FocusNode _passwordFocusNode = FocusNode(); //crear atributo en _builPasswordTextField
  EmailSignInFormType _formType = EmailSignInFormType.signIn;
  bool _submitted = false;  // Inicia en false para que el texto en rojo de mensaje de error no aparezca al inicio
  bool _isLoading = false;  // pasa a true mientras carga

  //variable que se envía a firebase
  String get _email => _emailController.text;
  String get _password => _passwordControler.text;

  /**
   * Método usado para elegir a que menú navegar
   * dependiendo si la sesión de usuario indica que es
   * un usuario administrador o no
   * */
  void _navigateToMenu() {
    if (OFTSession.isAdmin) {
      _navegateToAdminMenu();
    } else {
      _navegateToUserMenu();
    }
  }

  /**
   * Método usado para navegar al menu de usuario
   * */
  void _navegateToUserMenu(){
    Navigator.of(context).pushNamedAndRemoveUntil('home/user',(route) => false);
  }

  /**
   * Método usado para navegar al menu de administrador
   * */
  void _navegateToAdminMenu(){
    Navigator.of(context).pushNamedAndRemoveUntil('home/admin',(route) => false);
  }


  void _submit() async{
    setState(() {
      _submitted = true; //Cambia a true para que se muestre el texto en rojo en caso de que haya campos vacios
      _isLoading = true;
    });
    try{
      final model = Provider.of<LoginViewModel>(context, listen: false);
      //await Future.delayed((Duration(seconds: 5)));//Solo para modo desarrollo. Eliminar en producción
      await model.signIn(_email, _password);
      _navigateToMenu();
    }catch (e){
      print('======> Error emailandpassword method  ' +e.toString());
      showAlertDialog(
          context,
          title: 'Login no fue posible',
          content: e.toString(),
          defaultActionText: 'OK'
      );
    }finally{
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _NavigateToCreateAcount() {
    Navigator.pushNamed(context, 'register_account');
  }

  void _emailEditingComplete(){
    final newFocus = widget.emailValidator.isValid(_email)
        ? _passwordFocusNode : _emailFocusNode; //hasta que no esté correctamente en el campo email, no pasa al password
    FocusScope.of(context).requestFocus(newFocus);
  }

  void _toggleFormType(){
    _NavigateToCreateAcount();
    _emailController.clear();
    _passwordControler.clear();
  }

  void _resetPassword(){
    Navigator.pushNamed(context, 'reset_password');
  }

  List<Widget> _builChildren(){
    final primaryText = _formType == EmailSignInFormType.signIn ?
    'Ingresar' : 'crear una Cuenta';
    final secundarytext = _formType == EmailSignInFormType.signIn ?
    'Necesita una Cuentas? Registrate' : 'Tiene usted una cuenta? Ingresar';
    bool submitEnabled = widget.emailValidator.isValid(_email) &&
        widget.passwordValidator.isValid(_password) && !_isLoading;

    return [
      _buildEmailTextField(),
      SizedBox(height: 15.0),
      _buildPasswordTextField(),
      Container(
        alignment: Alignment.topLeft,
        child: TextButton(
            child: Text(
              'Olvido su Contraseña?' ,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w200,
                  fontSize: 9.0,
                  color: Colors.white
              ),
            ),
            onPressed: _resetPassword
        ),
      ),
      SizedBox(height: 10.0),
      FormSumbitButton(
        color: ColorStyles.buttonlogincolorprimary,
        colorText: Colors.indigo,
        text: primaryText,
        onPressed: submitEnabled ? _submit : null,
      ),
      SizedBox(height: 8.0),
      TextButton(
        child: Text(
            secundarytext,
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w200,
              fontSize: 16.0,
              color: Colors.white
          ),
        ),
        onPressed: !_isLoading ? _toggleFormType : null,
      ),
    ];
  }

  TextField _buildPasswordTextField() {
    //true           //false
    bool showErrorText = _submitted && !widget.passwordValidator.isValid(_password);
    return TextField(
      style: TextStyle(
        fontSize: 20.0,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w100,
        color: Colors.white
      ),
      controller: _passwordControler,
      focusNode: _passwordFocusNode,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 0.5,
          ),
        ),
        enabled: _isLoading == false,
        labelText: 'Password',
        labelStyle: TextStyle(
            fontSize: 15.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w100,
            color: Colors.white//FocusNode. ? Colors.blue : Colors.black
        ),
        errorText: showErrorText ? widget.invalidPasswordErrorText: null,
      ),
      obscureText: false,
      textInputAction: TextInputAction.done,
      onChanged: (password) => _updateState(),
      onEditingComplete: _submit,
    );
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
      textInputAction: TextInputAction.next, //Teclado salta a la siguiente linea
      onChanged: (email) => _updateState(),
      onEditingComplete: _emailEditingComplete,// cuando esté completo el campo, pasa a campos del password
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min, //Tamaño ocupado por el componente, por defecto es max
      children: _builChildren(),
    );
  }

  void _updateState() {
    setState(() {

    });
  }
}
