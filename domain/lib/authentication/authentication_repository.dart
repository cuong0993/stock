import 'package:dartz/dartz.dart';

import 'auth_failure.dart';

abstract class AuthenticationRepository {
  Future<Either<AuthFailure, Unit>> signInWithGoogle();

  Future<Either<AuthFailure, Unit>> signInWithFacebook();

  Future<Either<AuthFailure, Unit>> signInAnonymously();

  Option<String> getUserId();

  Future<Option<String>> getDeviceToken();
}
