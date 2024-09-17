import 'package:chat_app_c11/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterRepository {
  Future<Either<Failures, UserCredential>> register(
      {required String email, required String password});
}
