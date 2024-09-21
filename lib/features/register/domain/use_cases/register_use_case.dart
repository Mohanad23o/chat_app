import 'package:chat_app_c11/features/register/domain/repositories/register_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';

@injectable
class RegisterUseCase {
  RegisterRepository registerRepository;

  RegisterUseCase({required this.registerRepository});

  Future<Either<Failures, UserCredential>> register(
      {required String email, required String password}) {
    return registerRepository.register(email: email, password: password);
  }
}
