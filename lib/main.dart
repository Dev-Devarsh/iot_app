// ignore_for_file: prefer_const_constructors
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iot_app/Login-signup/login_screen.dart';
import 'package:iot_app/dashboard.dart';
import 'API/humidity.dart';
import 'API/smoke.dart';
import 'API/Temprature.dart';
import 'API/LDR.dart';
import 'API/IR.dart';
import 'API/SoilMoisture.dart';
import 'API/Pir.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart IOT',
      home: Main(),
      routes: <String, WidgetBuilder>{
        '/a': (BuildContext context) => smoke(),
        '/b': (BuildContext context) => Temprature(),
        '/c': (BuildContext context) => Ldr(),
        '/d': (BuildContext context) => Ir(),
        '/e': (BuildContext context) => Humidity(),
        '/f': (BuildContext context) => soil(),
        '/g': (BuildContext context) => Pir(),
      },
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Dasgboard();
          } else {
            return Login();
          }
        },
      ),
    );
  }
}
