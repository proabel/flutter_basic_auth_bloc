import 'package:basic_bloc_auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: BlocBuilder<AuthBloc, AuthState>(builder: (context, state){
          if(state is AuthInitial){
            return _buildLoginLayout(context);
          }else if(state is LoggingIn){
            return _buildSpinner();
          }else if(state is LoginSuccess){
            Navigator.pushReplacementNamed(context, '/home');
          }
        }),
      )
    );
  }

  Widget _buildLoginLayout(context){
    final TextEditingController emailCtlr = TextEditingController();
    final TextEditingController passwordCtlr = TextEditingController();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Login to app'),
          const SizedBox(height: 20),
          TextField(
            controller: emailCtlr,
            decoration: InputDecoration(
              labelText: 'Email'   
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: passwordCtlr,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',   
            ),
          ),
          const SizedBox(height: 20),
          RaisedButton(
            onPressed: (){},
            child: Text('Login')
          )
        ],
      )
    );
  }

  Widget _buildSpinner(){
    return Center(
      child: CircularProgressIndicator()
    );
  }
}