import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  String errorMessage;

  RegisterErrorState({required this.errorMessage});
}

class RegisterSuccessState extends RegisterState {
  UserCredential user;

  RegisterSuccessState({required this.user});
}

class RegisterLoadingState extends RegisterState {}
