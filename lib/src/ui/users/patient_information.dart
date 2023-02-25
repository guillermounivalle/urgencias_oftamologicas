
import 'dart:core';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../repository/services/database.dart';
import '../../blocs/validators/validators.dart';
import '../../data/models/patients.dart';
import '../../repository/common_widgets/dropdowmlist_custom.dart';
import  'package:intl/intl.dart';

import '../../repository/common_widgets/form_submit_button.dart';
import '../../repository/styles/color.styles.dart';

class PatientInformation extends StatefulWidget with EmptyFieldValidators{
  @override
  State<PatientInformation> createState() => _PatientInformationState();
}

class _PatientInformationState extends State<PatientInformation> {

  final TextEditingController _documentIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final FocusNode _documentIdFocusNode = FocusNode(); // crear atributo en _builEmailTextField
  final FocusNode _nameFocusNode = FocusNode(); // crear atributo en _builEmailTextField
  final FocusNode _lastnameFocusNode = FocusNode(); // crear atributo en _builEmailTextField
  String get _name => _nameController.text;
  String get _lastName => _lastNameController.text;
  String get _documentID => _documentIdController.text;
  bool _submitted = false;  // Inicia en false para que el texto en rojo de mensaje de error no aparezca al inicio
  bool _isLoading = false;  // pasa a true mientras carga
  final List<String> genero = <String>['Masculino','Femenino','Otro' ];
  final List<String> escolaridad = <String>['Primaria','Secundaria','Pre-Grado','Post-Grado' ];
  final List<String> procedencia = <String>[ 'Urbana', 'Rural'];
  final List<String> estrato = <String>['Seleccionar','1','2','3','4','5','6','+6' ];
  DateTime date = DateTime.now();
  String formatdate = DateFormat("yyyy-MM-dd").format(DateTime.now());

  Future<void> _inserData_User(BuildContext context) async {
    String birthdate = DateFormat("yyyy-MM-dd").format(DateTime.now());//fecha de nacimiento(no va DateTime.now())
    String colsutationdate = DateFormat("yyyy-MM-dd").format(DateTime.now());//Fecha actual
    final database = Provider.of<FirestoresDatabase>(context, listen: false);
    await database.addPatient(
        Patients(
            name: 'Guillermo',
            lastname: 'Hernandez',
            documentId: '94064730',
            gender: 'Masculino',
            socioeconomic: '3',
            schooling: 'Primaria',
            source: 'Rural',
            colsutationdate: colsutationdate,
            birthdate: birthdate));
  }

  Future<void> _ShowCalendar(BuildContext context) async {
    DateTime? newDate = await showDatePicker(
        context: context,
        locale: const Locale("es", "LA~C"),
        initialDate: date,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
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
        ? _nameFocusNode : _lastnameFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmación"),
          content: Text("Los datos del paciente fueron agregados con éxito!"),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
    bool showErrorText = _submitted && !widget.emailValidator.isValid(_lastName);
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
      //onEditingComplete: _lastNameEditingComplete,// cuando esté completo el campo, pasa a campos del password
    );
  }

  TextField _buildBirthDateTextField() {
    return TextField(
      style: TextStyle(
          fontSize: 20.0,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w100,
          color: Colors.white
      ),
      decoration: InputDecoration(
        suffixIcon: InkWell(
          onTap: () => _ShowCalendar(context),
          child: Container(
              width: 3.0,
              height: 3.0,
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 0.0),
              child: SvgPicture.asset(
                'images/calendar-week-fill.svg',
                width: 3.0,
                height: 3.0,
                color: Colors.white,
              )
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 0.5,
          ),
        ),
        enabled: true,
        labelText: 'Fecha de Nacimiento',
        labelStyle: TextStyle(
            fontSize: 15.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w100,
            color: Colors.white
        ),
      ),
      onChanged: (birtdate) => _updateState(),
      //onEditingComplete: _lastNameEditingComplete,// cuando esté completo el campo, pasa a campos del password
    );
  }

  TextField _buildConsulDateTextField() {
    return TextField(
      style: TextStyle(
          fontSize: 20.0,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w100,
          color: Colors.white
      ),
      decoration: InputDecoration(
        suffixIcon: InkWell(
          onTap: () => _ShowCalendar(context),
          child: Container(
              width: 3.0,
              height: 3.0,
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 0.0),
              child: SvgPicture.asset(
                'images/calendar-week-fill.svg',
                width: 3.0,
                height: 3.0,
                color: Colors.white,
              )
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 0.5,
          ),
        ),
        enabled: _isLoading == false,
        labelText: 'Fecha de Consulta',
        labelStyle: TextStyle(
            fontSize: 15.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w100,
            color: Colors.white
        ),
      ),
      onChanged: (birtdate) => _updateState(),
      //onEditingComplete: _lastNameEditingComplete,// cuando esté completo el campo, pasa a campos del password
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(//Leer documentación
          centerTitle: true,
          title: Text(
            'DATOS DEL PACIENTE',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w100,
                fontSize: 16.0,
                color: Colors.white
            ),
          ),
          backgroundColor: ColorStyles.appbarprimarycolor,//Title bar
        ),
      ),
      body: SingleChildScrollView( //Evita el desborde de pantalla
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: _buildContent(context),
        ),
      ),
    );
  }

  void _holamundo(String value){
    print("value es ======> "+ value);
  }
  Container _buildContent(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, //en el eje y
        crossAxisAlignment: CrossAxisAlignment.stretch, //en el eje x
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0), //add border radius
            child: Image.asset(
              "images/datos-paciente.jpg",
              height: 180.0,
              //width: 100.0,
              fit:BoxFit.cover,
            ),
          ),
          SizedBox(height: 15.0),
          Text(
            'Por favor ingrese los datos del paciente',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
                //fontStyle: FontStyle.italic,
                fontSize: 20.0,
                color: Colors.white
            ),
          ),
          SizedBox(height: 20.0),
          _buildDocumentIdTextField(),
          SizedBox(height: 20.0),
          _buildNameTextField(),
          SizedBox(height: 20.0),
          _buildLastNameTextField(),
          SizedBox(height: 20.0),
          _buildBirthDateTextField(),
          SizedBox(height: 20.0),
          Container(
            child: DropdownListCustom(
                listElements: genero,
                onChanged: _holamundo,
                labelInfo: "Genero",
                showSecondText: false
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            child: DropdownListCustom(
                listElements: escolaridad,
                onChanged: _holamundo,
                labelInfo: "Escolaridad",
                showSecondText: false
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            child: DropdownListCustom(
                listElements: procedencia,
                onChanged: _holamundo,
                labelInfo: "Procedencia",
                showSecondText: false
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            child: DropdownListCustom(
                listElements: estrato,
                onChanged: _holamundo,
                labelInfo: "Estrato Socio-Económico",
                showSecondText: false
            ),
          ),
          SizedBox(height: 20.0),
          _buildConsulDateTextField(),
          SizedBox(height: 20.0),
          FormSumbitButton(
              color: Colors.blue,
              colorText: Colors.black87,
              text: 'Agregar Paciente',
              onPressed: () {
                _showDialog(context);
              }
          ),
        ],
      ),
    );
  }
  void _updateState() {
    setState(() {

    });
  }
}







