

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:urgencias_oftamologicas/app/app_navigate/select_module_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({ super.key} );



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Urgencias Oftamológicas'),
          elevation: 10.0,  //Shadow bar. Crea un efecto sombra
      ),
      body: SingleChildScrollView(//Evita el desborde de pantalla
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: buildContent(),
      ),
    ),
    );
  }

  Container buildContent(){
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
                onPressed: (){},
              ),
              SelectModuleButton(
                assetName: 'images/declaracion.png',
                text: 'Administrador',
                colorText: Colors.black87,
                color: Colors.white,
                borderRadius: 8.0,
                onPressed: (){},
              ),
            ],
          )
        ],
      ),
    );
  }

}


