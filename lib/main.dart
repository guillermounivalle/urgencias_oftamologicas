import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:urgencias_oftamologicas/src/blocs/infrastructure/locator/service.locator.dart';
import 'package:urgencias_oftamologicas/src/blocs/infrastructure_route/oft.module.dart';
import 'package:urgencias_oftamologicas/src/blocs/infrastructure_route/router.dart';
import 'package:urgencias_oftamologicas/src/repository/services/auth.dart';
import 'package:urgencias_oftamologicas/src/repository/services/database.dart';
import 'package:urgencias_oftamologicas/src/blocs/main.module.dart';
import 'package:urgencias_oftamologicas/src/repository/styles/color.styles.dart';
import 'package:urgencias_oftamologicas/src/ui/users/user.modules.dart';
import 'package:urgencias_oftamologicas/firebase_options.dart';


//define entry point
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Run Firebase initialize
  await Firebase.initializeApp(
    name: "OFT-UV",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //the main method runApp. Into run App will go the root widget MyApp()
  setupServiceLocator();
  runApp(
      ListenableProvider(
        create: (context) => FirestoresDatabase(),child: MyApp(), )
  );
}

List<OFTViewModule> modules = [
  UserModules(),
  MainModule()
];


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final OFTRouter _router = OFTRouter();


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
      create: (context) => AuthService(),
      child: Provider<FirestoresDatabase>(
        create: (context) => FirestoresDatabase(),
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
          title: 'OFT-UV',//title src
          theme: ThemeData(//Leer documentaci{on themeData
              scaffoldBackgroundColor: ColorStyles.backgroundprimarycolor, //primary color of our entire src
              fontFamily: 'Poppins'
          ),
          initialRoute: 'homepage',
        ),
      ),//(context)Create argument, Auth() object that we need
    );
  }
}
