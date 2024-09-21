import 'package:chat_app_c11/core/fireBase/dataBase/data_base_utils.dart';
import 'package:chat_app_c11/features/login/domain/use_cases/login_use_case.dart';
import 'package:chat_app_c11/features/register/presentation/manager/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginScreenViewModel extends Cubit<LoginState> {
  LoginScreenViewModel({required this.loginUseCase})
      : super(LoginInitialState());

  //hold data - handle logic
  TextEditingController emailController = TextEditingController();
  LoginUseCase loginUseCase;
  final formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();

  void login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingState());
      var either = await loginUseCase.login(
          email: emailController.text, password: passwordController.text);
      either.fold((l) {
        emit(LoginErrorState(errorMessage: l.errorMessage));
        print(l.errorMessage);
      }, (r) async {
        emit(LoginSuccessState(user: r));
        var user = await DataBaseUtils.getUser(r.user?.uid ?? '');
        print('user name is : ${user?.name ?? ''}');
      });
    }
  }
}
