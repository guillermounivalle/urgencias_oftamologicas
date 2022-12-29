
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urgencias_oftamologicas/app/users/patient_admission.dart';
import 'package:urgencias_oftamologicas/app/users/patient_home.dart';
import 'package:urgencias_oftamologicas/app/users/patient_hospitalization.dart';
import 'package:urgencias_oftamologicas/app/users/patient_information.dart';
import 'package:urgencias_oftamologicas/app/users/patient_surgery.dart';
import 'package:urgencias_oftamologicas/services/auth.dart';
import '../../common_widgets/show_alert_dialog.dart';
import '../../services/database.dart';
import '../app_navigate/select_module_button.dart';
import '../models/patients.dart';
import  'package:intl/intl.dart';
class MenuUserPage extends StatelessWidget {
  const MenuUserPage({super.key}) ;

  Future<void> _inserData_User(BuildContext context) async{
    String cdate = DateFormat("yyyy-MM-dd").format(DateTime.now());
    final database = Provider.of<Database>(context, listen: false);
    await database.addPatient(
        Patients(
          name:'Guillermo',
          lastname: 'Hernandez',
          documentId: '94064730',
          gender: 'Masculino',
          socioeconomic: '3',
          schooling: 'Primaria',
          source: 'Rural',
          age:25,
          birthdate: cdate,
         ));
  }

  //Is not necesary make the Singleton Class
  //FirebaseAuth.instance is a static class
  Future<void> _signOut(BuildContext context) async {
    final auth = Provider.of<AuthBase>(context, listen: false);
    try {
      await auth.signOut();
    }catch (e){
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await showAlertDialog(
        context,
        title: 'Logout',
        content: 'Are you sure that you want to logout?',
        defaultActionText: 'OK',
        cancelActionText: 'Cancel'
    );
    if (didRequestSignOut == true){
      _signOut(context);
    }
  }

  Future<void> _navigateToModuleSelected(BuildContext context, String module)async{
    //TODO: navigate to module selected
    switch(module) {
      case "Admission": {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            fullscreenDialog: true,  //true muestra el diálogo para retornar
            builder: (context) => PatientAdmission(),
          ),
        );
      }
      break;
      case "Hospitalization": {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            fullscreenDialog: true,  //true muestra el diálogo para retornar
            builder: (context) => PatientHospitalization(),
          ),
        );
      }
      break;
      case "Surgery": {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            fullscreenDialog: true,  //true muestra el diálogo para retornar
            builder: (context) => PatientSurgery(),
          ),
        );
      }
      break;
      case "Home": {
        Navigator.of(context).push(
          MaterialPageRoute(
            fullscreenDialog: true,  //true muestra el diálogo para retornar
            builder: (context) => PatientHome(),
          ),
        );
      }
      break;
      case "Datos_Paciente": {
        Navigator.of(context).push(
          MaterialPageRoute(
            fullscreenDialog: true,  //true muestra el diálogo para retornar
            builder: (context) => PatientInformation(),
          ),
        );
      }
      break;
      default: {
        //statements;
      }
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Modulos de Atención'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
              ),
              child: new Text('Logout', style: TextStyle( fontSize: 18.0),),
              onPressed: () => _confirmSignOut(context),
            )
          ]
      ),
      body: SingleChildScrollView(//Evita el desborde de pantalla
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: buildContent(context),
        ),
      ),
    );
  }
  Container buildContent(BuildContext context){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, //en el eje y
        crossAxisAlignment: CrossAxisAlignment.stretch, //en el eje x
        children: <Widget>[
          SizedBox(height: 40.0),
          Text(
            'MODULOS',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 18.0,
                fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SelectModuleButton(
                assetName: 'images/declaracion.png',
                text: 'Ingreso Paciente',
                colorText: Colors.black87,
                color: Colors.white,
                borderRadius: 8.0,
                onPressed: () => _navigateToModuleSelected(context, 'Admission'),
              ),
              SelectModuleButton(
                assetName: 'images/declaracion.png',
                text: 'Hospitalización',
                colorText: Colors.black87,
                color: Colors.white,
                borderRadius: 8.0,
                onPressed: () => _navigateToModuleSelected(context, 'Hospitalization'),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SelectModuleButton(
                assetName: 'images/declaracion.png',
                text: 'Datos Paciente',
                colorText: Colors.black87,
                color: Colors.white,
                borderRadius: 8.0,
                onPressed: () => _navigateToModuleSelected(context, 'Surgery'),
              ),
              SelectModuleButton(
                assetName: 'images/declaracion.png',
                text: 'Cirugía',
                colorText: Colors.black87,
                color: Colors.white,
                borderRadius: 8.0,
                onPressed: () => _navigateToModuleSelected(context, 'Home'),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SelectModuleButton(
                assetName: 'images/declaracion.png',
                text: 'Cirugía',
                colorText: Colors.black87,
                color: Colors.white,
                borderRadius: 8.0,
                onPressed: () => _navigateToModuleSelected(context, 'Datos_Paciente'),
              ),
            ],
          )
        ],
      ),
    );
  }

}
