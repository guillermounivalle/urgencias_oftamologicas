
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../repository/styles/color.styles.dart';
import '../app.signin/login.view.model.dart';


class ReportsGenerate extends StatelessWidget {
  const ReportsGenerate({super.key}) ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(//Leer documentación
          centerTitle: true,
          title: Text(
            'Generación de reportes',
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
          SizedBox(height: 50.0),
          Text(
            'Pronto estará en operación.\n Estamos trabajando en ello',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
                //fontStyle: FontStyle.italic,
                fontSize: 20.0,
                color: Colors.white
            ),
          ),
        ],
      ),
    );
  }

}
