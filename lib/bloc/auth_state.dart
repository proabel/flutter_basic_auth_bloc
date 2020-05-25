part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class LoggingIn extends AuthState {
  @override
  List<Object> get props => [];
  
}

class LoginError extends AuthState{
  final String errorMsg;
  LoginError({this.errorMsg});
  @override
  List<Object> get props => [errorMsg];

}

class LoginSuccess extends AuthState{
  final Map user;
  LoginSuccess({this.user});
  @override
  List<Object> get props => [user];
}