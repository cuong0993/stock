import 'package:dartz/dartz.dart';
import 'package:domain/authentication/auth_failure.dart';
import 'package:domain/authentication/authentication_repository.dart' as domain;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: domain.AuthenticationRepository)
class AuthenticationRepository implements domain.AuthenticationRepository {
  AuthenticationRepository(
    this._firebaseAuth,
    this._googleSignIn,
    this._firebaseMessaging,
    this._facebookAuth,
  );

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FacebookAuth _facebookAuth;
  final FirebaseMessaging _firebaseMessaging;

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      if (kIsWeb) {
        final authProvider = GoogleAuthProvider();
        await _firebaseAuth.signInWithPopup(authProvider);
      } else {
        final googleUser = await _googleSignIn.signIn();
        if (googleUser == null) {
          return left(const AuthFailure.cancelledByUser());
        }
        final googleAuth = await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await _firebaseAuth.signInWithCredential(credential);
      }

      return right(unit);
    } on FirebaseAuthException catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithFacebook() async {
    try {
      final loginResult = await _facebookAuth.login(
        loginBehavior: LoginBehavior.nativeWithFallback,
      );
      if (loginResult.status == LoginStatus.success) {
        final credential =
            FacebookAuthProvider.credential(loginResult.accessToken!.token);
        await _firebaseAuth.signInWithCredential(credential);

        return right(unit);
      } else if (loginResult.status == LoginStatus.cancelled) {
        return left(const AuthFailure.cancelledByUser());
      } else {
        return left(const AuthFailure.serverError());
      }
    } on FirebaseAuthException catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Option<String> getUserId() => optionOf(_firebaseAuth.currentUser?.uid);

  @override
  Future<Option<String>> getDeviceToken() async {
    final token = await _firebaseMessaging.getToken();

    return optionOf(token);
  }

  @override
  Future<Either<AuthFailure, Unit>> signInAnonymously() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();

      return right(unit);
    } on FirebaseAuthException catch (_) {
      return left(const AuthFailure.serverError());
    }
  }
}
