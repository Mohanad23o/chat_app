import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginErrorState extends LoginState {
  String errorMessage;

  LoginErrorState({required this.errorMessage});
}

class LoginSuccessState extends LoginState {
  UserCredential user;

  LoginSuccessState({required this.user});
}

class LoginLoadingState extends LoginState {}
