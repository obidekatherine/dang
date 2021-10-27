import 'package:dang/pages/homePage.dart';
import 'package:dang/pages/navigationPage.dart';
import 'package:dang/pages/phonePage.dart';
import 'package:dang/pages/profilePage.dart';
import 'package:dang/pages/verificationPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

/*
void main() {
  runApp(MyApp());
}
*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFFFFFFFF),
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
      ),
      debugShowCheckedModeBanner: false,
      // home: FourthBody(),
      initialRoute: '/',
      routes: {
        '/': (context) => FirstBody(),
        '/1': (context) => SecondBody(),
        '/2': (context) => ThirdBody(),
        '/3': (context) => FourthBody(),
        '/nav': (context) => NavigationBtn(),
      },
    );
  }
}
