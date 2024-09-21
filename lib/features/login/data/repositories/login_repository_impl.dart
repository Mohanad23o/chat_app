import 'package:chat_app_c11/core/errors/failures.dart';
import 'package:chat_app_c11/features/login/data/data_sources/remote_data_source/login_remote_data_source.dart';
import 'package:chat_app_c11/features/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  LoginRemoteDataSource loginRemoteDataSource;

  LoginRepositoryImpl({required this.loginRemoteDataSource});

  @override
  Future<Either<Failures, UserCredential>> login(
      {required String email, required String password}) {
    return loginRemoteDataSource.login(email: email, password: password);
  }
}
