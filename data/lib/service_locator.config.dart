// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i7;
import 'package:dio/dio.dart' as _i20;
import 'package:domain/app/app_repository.dart' as _i14;
import 'package:domain/authentication/authentication_repository.dart' as _i16;
import 'package:domain/user/user_repository.dart' as _i12;
import 'package:firebase_app_check/firebase_app_check.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:firebase_core/firebase_core.dart' as _i4;
import 'package:firebase_messaging/firebase_messaging.dart' as _i8;
import 'package:firebase_storage/firebase_storage.dart' as _i9;
import 'package:flutter_cache_manager/flutter_cache_manager.dart' as _i18;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i10;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i11;

import 'src/app/app_repository.dart' as _i15;
import 'src/authentication/authentication_repository.dart' as _i17;
import 'src/firebase_cache_manager.dart' as _i19;
import 'src/injectable_modules.dart' as _i21;
import 'src/user/user_repository.dart'
    as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final authenticationModule = _$AuthenticationModule();
  final firebaseModule = _$FirebaseModule();
  final flutterModule = _$FlutterModule();
  final networkModule = _$NetworkModule();
  await gh.factoryAsync<_i3.FacebookAuth>(
      () => authenticationModule.getFacebookAuth(),
      preResolve: true);
  await gh.factoryAsync<_i4.FirebaseApp>(() => firebaseModule.firebaseApp,
      preResolve: true);
  await gh.factoryAsync<_i5.FirebaseAppCheck>(
      () => firebaseModule.getFirebaseAppCheck(),
      preResolve: true);
  gh.lazySingleton<_i6.FirebaseAuth>(() => firebaseModule.firebaseAuth);
  gh.lazySingleton<_i7.FirebaseFirestore>(
      () => firebaseModule.firebaseFirestore);
  gh.lazySingleton<_i8.FirebaseMessaging>(
      () => firebaseModule.firebaseMessaging);
  gh.lazySingleton<_i9.FirebaseStorage>(() => firebaseModule.firebaseStorage);
  gh.lazySingleton<_i10.GoogleSignIn>(() => authenticationModule.googleSignIn);
  await gh.factoryAsync<_i11.SharedPreferences>(
      () => flutterModule.sharedPreferences,
      preResolve: true);
  gh.lazySingleton<_i12.UserRepository>(() => _i13.UserRepository());
  gh.lazySingleton<_i14.AppRepository>(
      () => _i15.AppRepository(get<_i11.SharedPreferences>()));
  gh.lazySingleton<_i16.AuthenticationRepository>(() =>
      _i17.AuthenticationRepository(
          get<_i6.FirebaseAuth>(),
          get<_i10.GoogleSignIn>(),
          get<_i8.FirebaseMessaging>(),
          get<_i3.FacebookAuth>()));
  gh.lazySingleton<_i18.BaseCacheManager>(
      () => _i19.FirebaseCacheManager(get<_i9.FirebaseStorage>()));
  gh.lazySingleton<_i20.Dio>(
      () => networkModule.getDio(get<_i4.FirebaseApp>()));
  return get;
}

class _$AuthenticationModule extends _i21.AuthenticationModule {}

class _$FirebaseModule extends _i21.FirebaseModule {}

class _$FlutterModule extends _i21.FlutterModule {}

class _$NetworkModule extends _i21.NetworkModule {}
