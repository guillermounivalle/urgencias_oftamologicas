
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../blocs/app_navigate/select_user_of_list.dart';
import '../../repository/styles/color.styles.dart';
import '../app.signin/login.view.model.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key}) ;

  Future<void> _navigateToModuleSelected(BuildContext context, String module)async{
    //TODO: navigate to module selected

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(//Leer documentación
          centerTitle: true,
          title: Text(
            'LISTADO DE USUARIOS',
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
              "images/revisar-lista-usuarios.png",
              height: 180.0,
              //width: 100.0,
              fit:BoxFit.cover,
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Revisa la lista de usuarios',
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
          SelectUserListButton(
              assetName: 'images/personfill.svg',
              assetName1: 'images/bell-fill.svg',
              assetName2: 'images/check-circle-fill.svg',
              text: 'g.hernandez@gmail.com',
              colorText: Colors.white,
              color: ColorStyles.appbarprimarycolor,//Title bar
              borderRadius: 5.0,
              onPressed: () =>  _navigateToModuleSelected(context, 'patient_information')
          ),
          SizedBox(height: 20.0),
          SelectUserListButton(
              assetName: 'images/personfill.svg',
              assetName1: 'images/bell-fill.svg',
              assetName2: 'images/check-circle-fill.svg',
              text: 'user.admin@gmail.com',
              colorText: Colors.white,
              color: ColorStyles.appbarprimarycolor,//Title bar
              borderRadius: 5.0,
              onPressed: () => _navigateToModuleSelected(context, 'initial_evaluation')
          ),
          SizedBox(height: 20.0),
          SelectUserListButton(
              assetName: 'images/personfill.svg',
              assetName1: 'images/bell-fill.svg',
              assetName2: 'images/check-circle-fill.svg',
              text: 'g.hernandez@cgiar.org',
              colorText: Colors.white,
              color: ColorStyles.appbarprimarycolor,//Title bar
              borderRadius: 5.0,
              onPressed: () => _navigateToModuleSelected(context, 'Hospitalization')
          ),
          SizedBox(height: 20.0),
          SelectUserListButton(
              assetName: 'images/personfill.svg',
              assetName1: 'images/bell-fill.svg',
              assetName2: 'images/check-circle-fill.svg',
              text: 'user@gmail.com',
              colorText: Colors.white,
              color: ColorStyles.appbarprimarycolor,//Title bar
              borderRadius: 5.0,
              onPressed: () => _navigateToModuleSelected(context, 'Surgery')
          ),
          SizedBox(height: 20.0),
          SelectUserListButton(
              assetName: 'images/personfill.svg',
              assetName1: 'images/bell-fill.svg',
              assetName2: 'images/check-circle-fill.svg',
              text: 'test1@gmail.com',
              colorText: Colors.white,
              color: ColorStyles.appbarprimarycolor,//Title bar
              borderRadius: 5.0,
              onPressed: () => _navigateToModuleSelected(context, 'Patient_home')
          ),
          SizedBox(height: 20.0),
          SelectUserListButton(
              assetName: 'images/personfill.svg',
              assetName1: 'images/bell-fill.svg',
              assetName2: 'images/check-circle-fill.svg',
              text: 'test2@gmail.com',
              colorText: Colors.white,
              color: ColorStyles.appbarprimarycolor,//Title bar
              borderRadius: 5.0,
              onPressed: () => _navigateToModuleSelected(context, 'Patient_home')
          ),
        ],
      ),
    );
  }

}
