import 'dart:async';

import 'package:basic_bloc_auth/repositoties/auth-repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository);


  @override
  AuthState get initialState => AuthInitial();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield LoggingIn();
    if(event is LoginEvent){
      try{
        final user = await _authRepository.signInWithEmail(event.email, event.password);
        yield LoginSuccess(user: user);
      } on Error{
        yield LoginError(errorMsg: "Error loggin in");
      }
    }
  }
}
