import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urgencias_oftamologicas/src/repository/styles/color.styles.dart';
import 'package:urgencias_oftamologicas/src/ui/users/patient_information/patient_information.form.dart';
import 'package:urgencias_oftamologicas/src/ui/users/patient_information/patient_information.view.model.dart';

class PatientInformationFormView extends StatefulWidget {
  const PatientInformationFormView({Key? key}) : super(key: key);

  @override
  State<PatientInformationFormView> createState() => _PatientInformationFormViewState();
}

class _PatientInformationFormViewState extends State<PatientInformationFormView> {
  final _formKey = GlobalKey<FormState>();
  final PatientViewModel _model = PatientViewModel();

  @override
  void initState() {
    super.initState();
    _model.loadRequired();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PatientViewModel>(
      create: (_) => _model,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'DATOS DEL PACIENTE',
            style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 16.0,
                color: Colors.white
            ),
          ),
          backgroundColor: ColorStyles.appbarprimarycolor,//Title bar
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _header(),
              Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: PatientForm(formKey: _formKey,),
                  )
              ),
              ElevatedButton(
                  onPressed: () => _submit(),
                  child: Text('Agregar Paciente')
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                "images/datos-paciente.jpg",
                height: 180.0,
                //width: 100.0,
                fit:BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 15.0),
          Text(
            'Por favor ingrese los datos del paciente',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 20.0,
                color: Colors.white
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    var formState = _formKey.currentState!;
    if (formState.validate()) {
      formState.save();
      await _model.save(context);
      formState.reset();
    }
  }
}
