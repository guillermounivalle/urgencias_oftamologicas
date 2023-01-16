
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urgencias_oftamologicas/src/ui/admins/report_generate.dart';
import 'package:urgencias_oftamologicas/src/ui/admins/users_list.dart';

import '../../blocs/app_navigate/select_module_button.dart';
import '../../repository/styles/color.styles.dart';
import '../app.signin/login.view.model.dart';
import '../app.signin/signout.dart';


class MenuAdminPage extends StatelessWidget {
  const MenuAdminPage({super.key}) ;

  Future<void> _navigateToModuleSelected(BuildContext context, String module)async{
    //TODO: navigate to module selected
    switch(module) {
      case "reports_generate": {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            fullscreenDialog: true,  //true muestra el diálogo para retornar
            builder: (context) => ReportsGenerate(),
          ),
        );
      }
      break;
      case "users_list": {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            fullscreenDialog: true,  //true muestra el diálogo para retornar
            builder: (context) => UsersList(),
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
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0), //add border radius
            child: Image.asset(
              "images/admin.jpg",
              height: 180.0,
              //width: 100.0,
              fit:BoxFit.cover,
            ),
          ),
          SizedBox(height: 20.0),
          SelectModuleButton(
              assetName: 'images/clipboard-data-fill.svg',
              text: 'Generación de reportes',
              colorText: Colors.white,
              color: ColorStyles.appbarprimarycolor,//Title bar
              borderRadius: 5.0,
              onPressed: () =>  _navigateToModuleSelected(context, 'reports_generate')
          ),
          SizedBox(height: 20.0),
          SelectModuleButton(
              assetName: 'images/file-medical-fill.svg',
              text: 'Listados de Usuarios',
              colorText: Colors.white,
              color: ColorStyles.appbarprimarycolor,//Title bar
              borderRadius: 5.0,
              onPressed: () => _navigateToModuleSelected(context, 'users_list')
          ),
          SizedBox(height: 40.0),
          TextButton(
              onPressed: () => confirmSignOut(context),
              child: Text(
                textAlign: TextAlign.center,
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
