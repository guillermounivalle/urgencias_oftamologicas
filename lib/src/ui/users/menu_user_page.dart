
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urgencias_oftamologicas/src/ui/users/patient_home.dart';
import 'package:urgencias_oftamologicas/src/ui/users/patient_hospitalization.dart';
import 'package:urgencias_oftamologicas/src/ui/users/patient_surgery.dart';
import '../../blocs/app_navigate/select_module_button.dart';
import '../../repository/styles/color.styles.dart';
import '../app.signin/login.view.model.dart';
import '../app.signin/signout.dart';


class MenuUserPage extends StatelessWidget {
  const MenuUserPage({super.key}) ;

  Future<void> _navigateToModuleSelected(BuildContext context, String module)async{
    //TODO: navigate to module selected
    switch(module) {
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
          MaterialPageRoute(
            fullscreenDialog: true,  //true muestra el diálogo para retornar
            builder: (context) => PatientSurgery(),
          ),
        );
      }
      break;
      case "Patient_home": {
        Navigator.of(context).push(
          MaterialPageRoute(
            fullscreenDialog: true,  //true muestra el diálogo para retornar
            builder: (context) => PatientHome(),
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
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(//Leer documentación
          centerTitle: true,
          title: Text(
            'MÓDULOS',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w100,
                fontSize: 17.0,
                color: Colors.white
            ),
          ),
          backgroundColor: ColorStyles.appbarprimarycolor,//Title bar
        ),
      ),

      body:ChangeNotifierProvider<LoginViewModel>(
           create: (_) => LoginViewModel(),
           child: SingleChildScrollView(//Evita el desborde de pantalla
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: buildContent(context),
            ),
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
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0.0, 0, 0),
            height: 200,
            child: Image.asset("images/logo-HU_Horizontal_blanco.png"),
          ),
          SizedBox(height: 20.0),
          SelectModuleButton(
            assetName: 'images/clipboard-data-fill.svg',
            text: 'Datos del Paciente',
            colorText: Colors.white,
            color: ColorStyles.appbarprimarycolor,//Title bar
            borderRadius: 5.0,
            onPressed: () =>  Navigator.pushNamed(context, 'patient_information')
          ),
          SizedBox(height: 20.0),
          SelectModuleButton(
              assetName: 'images/file-medical-fill.svg',
              text: 'Evaluación inicial',
              colorText: Colors.white,
              color: ColorStyles.appbarprimarycolor,//Title bar
              borderRadius: 5.0,
              onPressed: () => Navigator.pushNamed(context, 'initial_evaluation')
          ),
          SizedBox(height: 20.0),
          SelectModuleButton(
              assetName: 'images/hospital-fill.svg',
              text: 'Hospitalización',
              colorText: Colors.white,
              color: ColorStyles.appbarprimarycolor,//Title bar
              borderRadius: 5.0,
              onPressed: () => _navigateToModuleSelected(context, 'Hospitalization')
          ),
          SizedBox(height: 20.0),
          SelectModuleButton(
              assetName: 'images/heart-pulse-fill.svg',
              text: 'Cirugía',
              colorText: Colors.white,
              color: ColorStyles.appbarprimarycolor,//Title bar
              borderRadius: 5.0,
              onPressed: () => _navigateToModuleSelected(context, 'Surgery')
          ),
          SizedBox(height: 20.0),
          SelectModuleButton(
              assetName: 'images/house-check-fill.svg',
              text: 'Cuidado en casa',
              colorText: Colors.white,
              color: ColorStyles.appbarprimarycolor,//Title bar
              borderRadius: 5.0,
              onPressed: () => _navigateToModuleSelected(context, 'Patient_home')
          ),
          SizedBox(height: 30.0),
          TextButton(
              onPressed: () => confirmSignOut(context),
              child: Text(
                'Cerrar Sesión',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w100,
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              )
          )
        ],
      ),
    );
  }

}
