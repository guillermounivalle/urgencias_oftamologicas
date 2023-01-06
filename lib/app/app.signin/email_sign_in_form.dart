
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urgencias_oftamologicas/app/app.signin/validators.dart';
import 'package:urgencias_oftamologicas/services/auth.dart';
import '../../common_widgets/form_submit_button.dart';
import '../../common_widgets/show_alert_dialog.dart';
import '../../infrastructure/auth/session.model.dart';
import 'login.view.model.dart';

enum EmailSignInFormType {signIn, register }

class EmailSignInForm extends StatefulWidget with EmailAndPasswordValidators{ //mixin

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

  //variable que se env{ia a firebase
  String get _email => _emailController.text;
  String get _password => _passwordControler.text;

  void _navigateToMenu() {
    if (OFTSession.isAdmin) {
      //Todo: cambiar a la ruta de admin
      Navigator.pushNamed(context, 'home/user');
    } else {
      Navigator.pushNamed(context, 'home/user');
    }
  }

  void _submit() async{
    setState(() {
      _submitted = true; //Cambia a true para que se muestre el texto en rojo en caso de que haya campos vacios
      _isLoading = true;
    });
    try{
      final model = Provider.of<LoginViewModel>(context, listen: false);
      //await Future.delayed((Duration(seconds: 5)));//Solo para modo desarrollo. Eliminar en producción
      if(_formType == EmailSignInFormType.signIn){
        await model.signIn(_email, _password);
        _navigateToMenu();
      }else{
        await model.createUser(_email, _password);
      }

    }catch (e){
      print('======> Error emailandpassword method  ' +e.toString());
      showAlertDialog(
          context,
          title: 'Sign In Failed',
          content: e.toString(),
          defaultActionText: 'OK'
      );
    }finally{
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _emailEditingComplete(){
    final newFocus = widget.emailValidator.isValid(_email)
        ? _passwordFocusNode : _emailFocusNode; //hasta que no est{e correctamente en el campo eail, no pasa al password
    FocusScope.of(context).requestFocus(newFocus);
  }

  void _toggleFormType(){
    setState(() {
      _submitted = false;
      _formType = _formType == EmailSignInFormType.signIn ?
      EmailSignInFormType.register : EmailSignInFormType.signIn;
    });
    _emailController.clear();
    _passwordControler.clear();
  }

  List<Widget> _builChildren(){
    final primaryText = _formType == EmailSignInFormType.signIn ?
    'Sign in' : 'Create an account';
    final secundarytext = _formType == EmailSignInFormType.signIn ?
    'Need an Account? Register' : 'Have an Account? Sign in';
    bool submitEnabled = widget.emailValidator.isValid(_email) &&
        widget.passwordValidator.isValid(_password) && !_isLoading;

    return [
      _buildEmailTextField(),
      SizedBox(height: 8.0),
      _buildPasswordTextField(),
      SizedBox(height: 8.0),
      FormSumbitButton(
        color: Colors.blue,
        colorText: Colors.indigo,
        text: primaryText,
        onPressed: submitEnabled ? _submit : null,
      ),
      SizedBox(height: 8.0),
      TextButton(
        child: Text(secundarytext),
        onPressed: !_isLoading ? _toggleFormType : null,
      ),
    ];
  }

  TextField _buildPasswordTextField() {
    //true           //false
    bool showErrorText = _submitted && !widget.passwordValidator.isValid(_password);
    return TextField(
      controller: _passwordControler,
      focusNode: _passwordFocusNode,
      decoration: InputDecoration(
        enabled: _isLoading == false,
        labelText: 'password',
        errorText: showErrorText ? widget.invalidPasswordErrorText: null,
      ),
      obscureText: true,
      textInputAction: TextInputAction.done,
      onChanged: (password) => _updateState(),
      onEditingComplete: _submit,
    );
  }

  TextField _buildEmailTextField() {
    bool showErrorText = _submitted && !widget.emailValidator.isValid(_email);
    return TextField(
      controller: _emailController,
      focusNode: _emailFocusNode,
      decoration: InputDecoration(
        enabled: _isLoading == false,
        labelText: 'Email',
        hintText: 'test@test.com',
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
    return Padding(
      padding: const EdgeInsets.all(16.0),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min, //Tamaño ocupado por el componente, por defecto es max
        children: _builChildren(),
      ),
    );
  }

  void _updateState() {
    setState(() {

    });
  }
}
