// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:agora_rtc_engine/rtc_engine.dart' as _i21;
import 'package:cloud_firestore/cloud_firestore.dart' as _i9;
import 'package:dio/dio.dart' as _i35;
import 'package:domain/app/app_repository.dart' as _i27;
import 'package:domain/authentication/authentication_repository.dart' as _i29;
import 'package:domain/conversation/conversation_repository.dart' as _i3;
import 'package:domain/conversation/message/message_repository.dart' as _i17;
import 'package:domain/meeting/meeting_repository.dart' as _i15;
import 'package:domain/post/comment/comment_repository.dart' as _i33;
import 'package:domain/post/like/like_repository.dart' as _i13;
import 'package:domain/post/post_repository.dart' as _i19;
import 'package:domain/post/tag/tag_repository.dart' as _i23;
import 'package:domain/user/user_repository.dart' as _i25;
import 'package:domain/video/video_service.dart' as _i37;
import 'package:firebase_app_check/firebase_app_check.dart' as _i7;
import 'package:firebase_auth/firebase_auth.dart' as _i8;
import 'package:firebase_core/firebase_core.dart' as _i6;
import 'package:firebase_messaging/firebase_messaging.dart' as _i10;
import 'package:firebase_storage/firebase_storage.dart' as _i11;
import 'package:flutter_cache_manager/flutter_cache_manager.dart' as _i31;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i12;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i22;

import 'src/app/app_repository.dart' as _i28;
import 'src/authentication/authentication_repository.dart' as _i30;
import 'src/conversation/conversation_repository.dart' as _i4;
import 'src/conversation/message/message_repository.dart' as _i18;
import 'src/firebase_cache_manager.dart' as _i32;
import 'src/injectable_modules.dart' as _i39;
import 'src/meeting/meeting_repository.dart' as _i16;
import 'src/post/comment/comment_repository.dart' as _i34;
import 'src/post/like/like_repository.dart' as _i14;
import 'src/post/post_repository.dart' as _i20;
import 'src/post/tag/tag_repository.dart' as _i24;
import 'src/user/user_repository.dart' as _i26;
import 'src/video/agora_token_api_client.dart' as _i36;
import 'src/video/video_service.dart'
    as _i38; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final authenticationModule = _$AuthenticationModule();
  final firebaseModule = _$FirebaseModule();
  final videoModule = _$VideoModule();
  final flutterModule = _$FlutterModule();
  final networkModule = _$NetworkModule();
  gh.lazySingleton<_i3.ConversationRepository>(
      () => _i4.ConversationRepository());
  gh.lazySingleton<_i5.FacebookAuth>(() => authenticationModule.facebookAuth);
  await gh.factoryAsync<_i6.FirebaseApp>(() => firebaseModule.firebaseApp,
      preResolve: true);
  await gh.factoryAsync<_i7.FirebaseAppCheck>(
      () => firebaseModule.getFirebaseAppCheck(),
      preResolve: true);
  gh.lazySingleton<_i8.FirebaseAuth>(() => firebaseModule.firebaseAuth);
  gh.lazySingleton<_i9.FirebaseFirestore>(
      () => firebaseModule.firebaseFirestore);
  gh.lazySingleton<_i10.FirebaseMessaging>(
      () => firebaseModule.firebaseMessaging);
  gh.lazySingleton<_i11.FirebaseStorage>(() => firebaseModule.firebaseStorage);
  gh.lazySingleton<_i12.GoogleSignIn>(() => authenticationModule.googleSignIn);
  gh.lazySingleton<_i13.LikeRepository>(
      () => _i14.LikeRepository(get<_i9.FirebaseFirestore>()));
  gh.lazySingleton<_i15.MeetingRepository>(() => _i16.MeetingRepository());
  gh.lazySingleton<_i17.MessageRepository>(() => _i18.MessageRepository());
  gh.lazySingleton<_i19.PostRepository>(
      () => _i20.PostRepository(get<_i11.FirebaseStorage>()));
  gh.factoryAsync<_i21.RtcEngine>(() => videoModule.getRtcEngine());
  await gh.factoryAsync<_i22.SharedPreferences>(
      () => flutterModule.sharedPreferences,
      preResolve: true);
  gh.lazySingleton<_i23.TagRepository>(() => _i24.TagRepository());
  gh.lazySingleton<_i25.UserRepository>(() => _i26.UserRepository());
  gh.lazySingleton<_i27.AppRepository>(
      () => _i28.AppRepository(get<_i22.SharedPreferences>()));
  gh.lazySingleton<_i29.AuthenticationRepository>(() =>
      _i30.AuthenticationRepository(
          get<_i8.FirebaseAuth>(),
          get<_i12.GoogleSignIn>(),
          get<_i10.FirebaseMessaging>(),
          get<_i5.FacebookAuth>()));
  gh.lazySingleton<_i31.BaseCacheManager>(
      () => _i32.FirebaseCacheManager(get<_i11.FirebaseStorage>()));
  gh.lazySingleton<_i33.CommentRepository>(
      () => _i34.CommentRepository(get<_i9.FirebaseFirestore>()));
  gh.lazySingleton<_i35.Dio>(
      () => networkModule.getDio(get<_i6.FirebaseApp>()));
  gh.factory<_i36.AgoraTokenApiClient>(
      () => _i36.AgoraTokenApiClient(get<_i35.Dio>()));
  gh.lazySingletonAsync<_i37.VideoService>(() async => _i38.VideoService(
      get<_i36.AgoraTokenApiClient>(), await get.getAsync<_i21.RtcEngine>()));
  return get;
}

class _$AuthenticationModule extends _i39.AuthenticationModule {}

class _$FirebaseModule extends _i39.FirebaseModule {}

class _$VideoModule extends _i39.VideoModule {}

class _$FlutterModule extends _i39.FlutterModule {}

class _$NetworkModule extends _i39.NetworkModule {}
