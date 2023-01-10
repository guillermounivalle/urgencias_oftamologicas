
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urgencias_oftamologicas/app/validators/validators.dart';
import 'package:urgencias_oftamologicas/styles/color.styles.dart';
import '../../../common_widgets/form_submit_button.dart';
import '../../../common_widgets/show_alert_dialog.dart';
import '../../../services/database.dart';
import '../../models/medical_staff.dart';
import '../register.view.model.dart';

class RegisterAccountForm extends StatefulWidget with EmptyFieldValidators{ //mixin

  @override
  _RegisterAccountFormState createState()=> _RegisterAccountFormState();
}

class _RegisterAccountFormState extends State<RegisterAccountForm> {

  final TextEditingController _documentIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordControler = TextEditingController();

  final FocusNode _documentIdFocusNode = FocusNode(); // crear atributo en _builEmailTextField
  final FocusNode _nameFocusNode = FocusNode(); // crear atributo en _builEmailTextField
  final FocusNode _lastnameFocusNode = FocusNode(); // crear atributo en _builEmailTextField
  final FocusNode _emailFocusNode = FocusNode(); // crear atributo en _builEmailTextField
  final FocusNode _passwordFocusNode = FocusNode(); //crear atributo en _builPasswordTextField
  bool _submitted = false;  // Inicia en false para que el texto en rojo de mensaje de error no aparezca al inicio
  bool _isLoading = false;  // pasa a true mientras carga

  //variable que se env{ia a firebase
  String get _email => _emailController.text;
  String get _password => _passwordControler.text;
  String get _name => _nameController.text;
  String get _lastName => _lastNameController.text;
  String get _documentID => _documentIdController.text;

  Future<void> _inserData_User(BuildContext context) async{
    try{
      final database = Provider.of<FirestoresDatabase>(context,listen: false);
      await database.addUser(
          MedicalStaff(
              name: _name,
              documentId: _documentID,
              lastname: _lastName,
              email: _email,
              isactive: false,
              isadministrator: false
          )
      );
    }catch (e){
      print('=======>  error inserDataUser   ===>  '+ e.toString());
    }finally{
      _showMessageRegisterSuccessful();
    }
  }

  /**
   * Método usado para mensaje de creación de cuenta fue exitoso
   * */
  void _showMessageRegisterSuccessful(){
    showAlertDialog(
      context,
      title: 'Registro Exitoso',
      content: 'La cuenta se ha registrado con éxito\n'
          'Muy pronto un administrador activará la cuenta',
      defaultActionText: 'TERMINAR',
    );
  }

  /**
   * Método usado para mensaje de creación de cuenta no fue posible
   * */
  void _showMessageRegisterError(){
    showAlertDialog(
      context,
      title: 'Erro de Registro',
      content: 'La cuenta no se pudo registrar\n'
          'Seleccione TERMINAR e intente registrar su cuenta de nuevo',
      defaultActionText: 'TERMINAR',
    );
  }

  Future<void> _submit() async{
    setState(() {
      _submitted = true; //Cambia a true para que se muestre el texto en rojo en caso de que haya campos vacios
      _isLoading = true;
    });
    try{
      final model = Provider.of<RegisterAccountModel>(context, listen: false);
      await model.createUser(_email, _password);
    }catch (e){
      print('======> Error emailandpassword method  ' +e.toString());
      showAlertDialog(
          context,
          title: 'Falló el registro de la cuenta',
          content: e.toString(),
          defaultActionText: 'OK'
      );
    }finally{
      _inserData_User(context);
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _NavigateToSignInPage() {
    Navigator.of(context).pushNamedAndRemoveUntil('login', (route) => false);
  }

  void _documentIdlEditingComplete(){
    //hasta que no esté correctamente en el campo documento identidad,
    // no pasa al campo nombre
    final newFocus = widget.documentIdValidator.isValid(_documentID)
        ? _nameFocusNode : _documentIdFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  void _nameEditingComplete(){
    //hasta que no esté correctamente en el campo Nombre,
    // no pasa al campo Apellido
    final newFocus = widget.nameValidator.isValid(_name)
        ? _lastnameFocusNode : _nameFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  void _lastNameEditingComplete(){
    //hasta que no esté correctamente en el campo Apellido,
    // no pasa al campo Email
    final newFocus = widget.lastnameValidator.isValid(_lastName)
        ? _emailFocusNode : _lastnameFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  void _emailEditingComplete(){
    //hasta que no esté correctamente en el campo email,
    // no pasa al password
    final newFocus = widget.emailValidator.isValid(_email)
        ? _passwordFocusNode : _emailFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  void _toggleFormType(){
    _NavigateToSignInPage();
    _emailController.clear();
    _passwordControler.clear();
  }


  TextField _buildDocumentIdTextField() {
    bool showErrorText = _submitted && !widget.documentIdValidator.isValid(_documentID);
    return TextField(
      style: TextStyle(
          fontSize: 20.0,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w100,
          color: Colors.white
      ),
      controller: _documentIdController,
      focusNode: _documentIdFocusNode,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 0.5,
          ),
        ),
        enabled: _isLoading == false,
        labelText: 'Documento de identidad',
        labelStyle: TextStyle(
            fontSize: 15.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w100,
            color: Colors.white//FocusNode. ? Colors.blue : Colors.black
        ),
        errorText: showErrorText ? widget.invalidDocumentIdErrorText : null,
      ),
      autocorrect: false,  // no trabaja el autocorrector
      keyboardType: TextInputType.number, //teclado para n{umero
      textInputAction: TextInputAction.next, //Teclado salta a la siguiente linea
      onChanged: (documentid) => _updateState(),
      onEditingComplete: _documentIdlEditingComplete,
    );
  }

  TextField _buildNameTextField() {
    bool showErrorText = _submitted && !widget.emailValidator.isValid(_name);
    return TextField(
      style: TextStyle(
          fontSize: 20.0,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w100,
          color: Colors.white
      ),
      controller: _nameController,
      focusNode: _nameFocusNode,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 0.5,
          ),
        ),
        enabled: _isLoading == false,
        labelText: 'Nombre',
        labelStyle: TextStyle(
            fontSize: 15.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w100,
            color: Colors.white
        ),
        errorText: showErrorText ? widget.invalidEmailErrorText : null,
      ),
      autocorrect: false,  // no trabaja el autocorrector
      keyboardType: TextInputType.name, //teclado para nombres
      textInputAction: TextInputAction.next, //Teclado salta a la siguiente linea
      onChanged: (name) => _updateState(),
      onEditingComplete: _nameEditingComplete,// cuando esté completo el campo, pasa a campos del password
    );
  }

  TextField _buildLastNameTextField() {
    bool showErrorText = _submitted && !widget.emailValidator.isValid(_email);
    return TextField(
      style: TextStyle(
          fontSize: 20.0,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w100,
          color: Colors.white
      ),
      controller: _lastNameController,
      focusNode: _lastnameFocusNode,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 0.5,
          ),
        ),
        enabled: _isLoading == false,
        labelText: 'Apellido',
        labelStyle: TextStyle(
            fontSize: 15.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w100,
            color: Colors.white
        ),
        errorText: showErrorText ? widget.invalidLastNameErrorText : null,
      ),
      autocorrect: false,  // no trabaja el autocorrector
      keyboardType: TextInputType.name, //teclado para email
      textInputAction: TextInputAction.next, //Teclado salta a la siguiente linea
      onChanged: (lastname) => _updateState(),
      onEditingComplete: _lastNameEditingComplete,// cuando esté completo el campo, pasa a campos del password
    );
  }

  TextField _buildEmailTextField() {
    bool showErrorText = _submitted && !widget.emailValidator.isValid(_lastName);
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
        errorText: showErrorText ? widget.invalidNameErrortext : null,
      ),
      autocorrect: false,  // no trabaja el autocorrector
      keyboardType: TextInputType.emailAddress, //teclado para email
      textInputAction: TextInputAction.next, //Teclado salta a la siguiente linea
      onChanged: (email) => _updateState(),
      onEditingComplete: _emailEditingComplete,// cuando esté completo el campo, pasa a campos del password
    );
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

  List<Widget> _builChildren(){
    final primaryText = 'Registrar cuenta';
    final secundarytext = 'Tiene usted una cuenta? Ir a Login';
    bool submitEnabled = widget.emailValidator.isValid(_email) &&
        widget.passwordValidator.isValid(_password) && !_isLoading;
    //bool showErrorText = _submitted && !widget.emailValidator.isValid(_email);
    return [
      _buildDocumentIdTextField(),
      SizedBox(height: 15.0),
      _buildNameTextField(),
      SizedBox(height: 15.0),
      _buildLastNameTextField(),
      SizedBox(height: 15.0),
      _buildEmailTextField(),
      SizedBox(height: 15.0),
      _buildPasswordTextField(),
      SizedBox(height: 10.0),
      FormSumbitButton(
        color: ColorStyles.buttonlogincolorprimary,
        colorText: Colors.indigo,
        text: primaryText,
        onPressed: _submit,
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
