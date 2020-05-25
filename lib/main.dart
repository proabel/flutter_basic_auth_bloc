import 'package:flutter/material.dart';
import './pages/login-page.dart';
import './pages/home-page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/' : (context) => LoginPage(),
        '/home': (context) => HomePage()
      },
    );
  }
}