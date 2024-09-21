import 'package:chat_app_c11/features/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';

@injectable
class LoginUseCase {
  LoginRepository loginRepository;

  LoginUseCase({required this.loginRepository});

  Future<Either<Failures, UserCredential>> login(
      {required String email, required String password}) {
    return loginRepository.login(email: email, password: password);
  }
}
