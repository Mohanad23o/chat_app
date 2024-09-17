import 'package:chat_app_c11/features/login/presentation/manager/cubit/login_state.dart';
import 'package:chat_app_c11/features/register/domain/use_cases/register_use_case.dart';
import 'package:chat_app_c11/features/register/presentation/manager/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterScreenViewModel extends Cubit<RegisterState> {
  RegisterScreenViewModel({required this.registerUseCase})
      : super(RegisterInitialState());

  //hold data - handle logic
  TextEditingController emailController = TextEditingController();
  RegisterUseCase registerUseCase;
  TextEditingController userNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();

  void register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoadingState());
      var either = await registerUseCase.register(
          email: emailController.text, password: passwordController.text);
      either.fold((l) {
        emit(RegisterErrorState(errorMessage: l.errorMessage));
        print(l.errorMessage);
      }, (r) {
        emit(RegisterSuccessState(user: r));
      });
    }
  }
}
