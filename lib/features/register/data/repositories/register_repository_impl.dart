import 'package:chat_app_c11/core/errors/failures.dart';
import 'package:chat_app_c11/features/register/data/data_sources/remote_data_source/register_remote_data_source.dart';
import 'package:chat_app_c11/features/register/domain/repositories/register_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RegisterRepository)
class RegisterRepositoryImpl implements RegisterRepository {
  RegisterRemoteDataSource registerRemoteDataSource;

  RegisterRepositoryImpl({required this.registerRemoteDataSource});

  @override
  Future<Either<Failures, UserCredential>> register(
      {required String email, required String password}) {
    return registerRemoteDataSource.register(email: email, password: password);
  }
}
