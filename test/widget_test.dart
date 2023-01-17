
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:urgencias_oftamologicas/src/ui/app.signin/email_sign_in_page.dart';
import 'package:urgencias_oftamologicas/src/ui/home_page.dart';
import 'package:urgencias_oftamologicas/src/ui/users/patient_information.dart';

//Inicia ejecución
void main() {
  //Vamos a probar que el Home page tenfa el texto indicado
  testWidgets('Home Page tiene texto información', (WidgetTester tester)  async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Text('Por favor ingrese sus datos'),
      ),
    ));

    // Encuentra un Widget que muestra la letra 'H'
    expect(find.text('Por favor ingrese sus datos'), findsOneWidget);
  });

  //Probando que un padding maneje un childwidget de padding
  testWidgets('Encontrando el padding de cada vista', (WidgetTester tester) async {
    final childWidget = Padding(padding: EdgeInsets.all(16.0));

    // Proporciona nuestro childWidget al Container
    await tester.pumpWidget(Container(child: childWidget));

    // Busca por el childWidget en el árbol y verifica que exista
    expect(find.byWidget(childWidget), findsOneWidget);
  });

  //El SingleChildScrollView Tiene un childWidget Padding()
  testWidgets('Encontrando el padding de cada vista', (WidgetTester tester) async {
    final childWidget = Padding( padding: const EdgeInsets.all(20.0),);

    // Proporciona nuestro childWidget al Container
    await tester.pumpWidget(SingleChildScrollView(child: childWidget));

    // Busca por el childWidget en el árbol y verifica que exista
    expect(find.byWidget(childWidget), findsOneWidget);
  });
}
