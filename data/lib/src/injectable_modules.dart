// ignore_for_file: do_not_use_environment, avoid_redundant_argument_values, prefer-match-file-name

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class AuthenticationModule {
  @lazySingleton
  GoogleSignIn get googleSignIn => GoogleSignIn();

  @lazySingleton
  FacebookAuth get facebookAuth => FacebookAuth.instance;
}

@module
abstract class FirebaseModule {
  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @lazySingleton
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;

  @lazySingleton
  FirebaseStorage get firebaseStorage => FirebaseStorage.instance;

  @lazySingleton
  FirebaseMessaging get firebaseMessaging => FirebaseMessaging.instance;

  @preResolve
  Future<FirebaseApp> get firebaseApp => Firebase.initializeApp();

  @preResolve
  Future<FirebaseAppCheck> getFirebaseAppCheck() async {
    // TODO https://github.com/firebase/flutterfire/issues/8019.
    try {
      await FirebaseAppCheck.instance.activate(
        webRecaptchaSiteKey: 'TODO',
      );
    } on Exception catch (_) {}

    return FirebaseAppCheck.instance;
  }
}

@module
abstract class FlutterModule {
  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
}

@module
abstract class NetworkModule {
  @lazySingleton
  Dio getDio(FirebaseApp firebaseApp) => Dio(
        BaseOptions(
          baseUrl:
              'https://${const String.fromEnvironment('ENV_FIREBASE_APP_REGION')}-${firebaseApp.options.projectId}.cloudfunctions.net',
        ),
      );
}
