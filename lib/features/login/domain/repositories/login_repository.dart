import 'package:chat_app_c11/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepository {
  Future<Either<Failures, UserCredential>> login(
      {required String email, required String password});
}
