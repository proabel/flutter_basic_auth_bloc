import 'package:basic_bloc_auth/bloc/auth_bloc.dart';
import 'package:basic_bloc_auth/repositoties/firebase-auth-repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import './pages/login-page.dart';
import './pages/home-page.dart';
void main() {
  final FirebaseAuthRepo _authRepository = FirebaseAuthRepo();
  runApp(
    MultiProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc(_authRepository),)
      ],
      child: MyApp()
    )
  );
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
