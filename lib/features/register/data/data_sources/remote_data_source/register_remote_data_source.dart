import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/errors/failures.dart';

abstract class RegisterRemoteDataSource {
  Future<Either<Failures, UserCredential>> register(
      {required String email, required String password});
}
