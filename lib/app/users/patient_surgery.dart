
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urgencias_oftamologicas/app/validators/validators.dart';
import '../../styles/color.styles.dart';
import  'package:intl/intl.dart';

class PatientSurgery extends StatefulWidget with EmptyFieldValidators{

  @override
  State<PatientSurgery> createState() => _PatientSugery();
}

class _PatientSugery extends State<PatientSurgery>{

  final TextEditingController _documentIdController = TextEditingController();
  final FocusNode _documentIdFocusNode = FocusNode(); // crear atributo en _builEmailTextField
  String get _documentID => _documentIdController.text;
  bool _submitted = false;  // Inicia en false para que el texto en rojo de mensaje de error no aparezca al inicio
  bool _isLoading = false;  // pasa a true mientras carga
  DateTime date = DateTime.now();
  String formatdate = DateFormat("yyyy-MM-dd").format(DateTime.now());
  final List<String> ojo_afectado = <String>['Seleccionar','Izquierdo','Derecho','Ambos' ];
  final List<String> patologia = <String>['Seleccionar','Izquierdo','Derecho','Ambos' ];

  Future<void> _ShowCalendar(BuildContext context) async {
    DateTime? newDate = await showDatePicker(
        context: context,
        locale: const Locale("es", "LA~C"),
        initialDate: date,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
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
            'CIRUGÍA',
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


  Container _buildContent(BuildContext context){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, //en el eje y
        crossAxisAlignment: CrossAxisAlignment.stretch, //en el eje x
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0), //add border radius
            child: Image.asset(
              "images/cirugia.jpg",
              height: 180.0,
              //width: 100.0,
              fit:BoxFit.cover,
            ),
          ),
          SizedBox(height: 15.0),
          Text(
            'Por favor ingrese los datos de la cirugìa',
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
          _buildConsulDateTextField(),

        ],
      ),
    );
  }

}

class _updateState {
}
