import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:urgencias_oftamologicas/services/auth.dart';
import 'app/landing_page.dart';



//define entry point
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Run Firebase initialize
  await Firebase.initializeApp();
  //the main method runApp. Into run App will go the root widget MyApp()
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Urgencias Oftamológicas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingPage(
        auth: Auth()
      ),
    );
  }
}

