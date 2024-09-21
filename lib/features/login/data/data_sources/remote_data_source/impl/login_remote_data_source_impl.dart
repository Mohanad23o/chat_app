import 'package:chat_app_c11/core/errors/exceptions.dart';
import 'package:chat_app_c11/core/errors/failures.dart';
import 'package:chat_app_c11/features/login/data/data_sources/remote_data_source/login_remote_data_source.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  @override
  Future<Either<Failures, UserCredential>> login(
      {required String email, required String password}) async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        if (credential.user != null) {
          return Right(credential);
        } else {
          return Left(
              ServerError(errorMessage: InternetExceptions.serverError));
        }
      } else {
        return Left(NetworkError(errorMessage: InternetExceptions.noInternet));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}
