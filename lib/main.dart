import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:urgencias_oftamologicas/app/infrastructure/ciat.module.dart';
import 'package:urgencias_oftamologicas/app/infrastructure/router.dart';
import 'package:urgencias_oftamologicas/app/main.module.dart';
import 'package:urgencias_oftamologicas/app/users/patient.module.dart';
import 'package:urgencias_oftamologicas/firebase_options.dart';
import 'package:urgencias_oftamologicas/infrastructure/locator/service.locator.dart';
import 'package:urgencias_oftamologicas/services/auth.dart';
import 'package:urgencias_oftamologicas/styles/color.styles.dart';

import 'app/landing_page.dart';

//define entry point
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Run Firebase initialize
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //the main method runApp. Into run App will go the root widget MyApp()
  setupServiceLocator();
  runApp(MyApp());
}

List<CIATViewModule> modules = [
  PatientModule(),
  MainModule()
];


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final CIATRouter _router = CIATRouter();


  @override
  void initState() {
    super.initState();
    for (final module in modules) {
      _router.addRoutes(module.routes());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(//<AuthBase> Create type Annotation
      create: (context) => AuthService(), //(context)Create argument, Auth() object that we need
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: _router.generateRoute,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate
        ],
        supportedLocales: [
          const Locale('en'),
          const Locale('fr'),
          const Locale('es')
        ],
        title: 'OFT-UV',//title app
        theme: ThemeData(//Leer documentaci{on themeData
          scaffoldBackgroundColor: ColorStyles.backgroundprimarycolor, //primary color of our entire app
        ),
       initialRoute: 'homepage',
      ), //Llamamos como home a la clase LandingPage
    );
  }
}

/**
 * MaterialApp(
    title: 'Urgencias Oftamológicas',
    theme: ThemeData(
    primarySwatch: Colors.blue,
    ),
    home: LandingPage(
    ),
    );*/