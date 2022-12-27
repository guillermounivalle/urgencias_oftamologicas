
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urgencias_oftamologicas/services/auth.dart';
import '../../common_widgets/show_alert_dialog.dart';
import '../app_navigate/select_module_button.dart';

class MenuAdminsPage extends StatelessWidget {
  const MenuAdminsPage({super.key}) ;


  //Is not necesary make the Singleton Class
  //FirebaseAuth.instance is a static class
  Future<void> _signOut(BuildContext context) async{
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Modulo Administrador'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.black87,
              ),
              child: new Text('Logout', style: TextStyle( fontSize: 18.0),),
              onPressed: () => _confirmSignOut(context),
            )
          ]
      ),
    );
  }
  Container buildContent(BuildContext context){
    List imgList = [
      'images/hospital.jpg',
      'images/registerimage.jpg'
    ];
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, //en el eje y
        crossAxisAlignment: CrossAxisAlignment.stretch, //en el eje x
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              aspectRatio: 16/9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 1000),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),
            items: imgList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.white
                    ),
                    child: Image.asset(i.toString()),
                    //child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(height: 40.0),
          Text(
            'Seleccione el módulo al que desea ingresar',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 18.0,
                fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SelectModuleButton(
                assetName: 'images/declaracion.png',
                text: 'Usuario',
                colorText: Colors.black87,
                color: Colors.white,
                borderRadius: 8.0,
                onPressed: () {}
              ),
              SelectModuleButton(
                assetName: 'images/declaracion.png',
                text: 'Administrador',
                colorText: Colors.black87,
                color: Colors.white,
                borderRadius: 8.0,
                onPressed:  () => {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
