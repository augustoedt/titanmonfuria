import 'package:flutter/material.dart';
import 'package:titamon_furia/Pages/lobby_page.dart';
import 'package:flutter/services.dart';
import 'package:titamon_furia/Pages/login_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Ajuste de orientação forcada
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: Color(0xFFE3F8D0)
      ),
      home: LoginPage(),
    );
  }
}


