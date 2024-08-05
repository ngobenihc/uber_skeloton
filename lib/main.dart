import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/model/lifts_view_model.dart';
import 'package:flutter_application_1/slap_sreen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp( child: const MaterialApp(
      home: MySplashScreen(),


    ),
    ),
  );

}

class MyApp extends StatefulWidget{
  final Widget? child;

  MyApp({this.child});

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_MyAppState>()!.restartApp();
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  Key key = UniqueKey();
  void restartApp(){
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Lifts',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChangeNotifierProvider(
          create: (context) => LiftsViewModel(),
          child: const MySplashScreen(),

        )

    );
  }
}