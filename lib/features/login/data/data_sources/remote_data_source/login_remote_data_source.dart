import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/errors/failures.dart';

abstract class LoginRemoteDataSource {
  Future<Either<Failures, UserCredential>> login(
      {required String email, required String password});
}
