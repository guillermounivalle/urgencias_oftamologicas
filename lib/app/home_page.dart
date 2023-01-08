
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app_navigate/select_module_image_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({ super.key} );

  void _navigateToLogin(BuildContext context) {
    Navigator.pushNamed(context, 'login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40.0, 80.0, 40.0, 0),
          child: buildContent(context),
        ),
      )
    );
  }

  Container buildContent(BuildContext context){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, //en el eje y
        crossAxisAlignment: CrossAxisAlignment.stretch, //en el eje x
        children: <Widget>[
          Container(
            height: 220,
            child: Image.asset("images/logo-HU_Horizontal_blanco.png"),
          ),
          SizedBox(height: 10.0),
          Text(
            'Seleccione el módulo al que deseas ingresar',
                textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w200,
              //fontStyle: FontStyle.italic,
              fontSize: 22.0,
              color: Colors.white
            ),
          ),
          SizedBox(height: 30.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SelectModuleImageButton(
                assetName: 'images/botonmodulousuario.png',
                onPressed: () => _navigateToLogin(context),
                text: 'Usuario',
              ),
              SizedBox(height: 30.0),
              SelectModuleImageButton(
                assetName: 'images/botonmoduloadmin.png',
                text: 'Administrador',
                onPressed:  () => _navigateToLogin(context),
              ),
            ],
          )
        ],
      ),
    );
  }

}


