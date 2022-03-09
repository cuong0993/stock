// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i14;
import 'package:domain/video/video_config.dart' as _i16;
import 'package:flutter/material.dart' as _i15;

import '../authentication/authentication_page.dart' as _i7;
import '../authentication/require_authentication_page.dart' as _i13;
import '../conversation/message_page.dart' as _i12;
import '../post/create/create_post_page.dart' as _i5;
import '../post/detail_post_page.dart' as _i6;
import '../user/user_page.dart' as _i8;
import '../video/video_config_page.dart' as _i4;
import '../video/video_page.dart' as _i3;
import 'home_page.dart' as _i2;
import 'locale_page.dart' as _i9;
import 'settings_page.dart' as _i11;
import 'splash_page.dart' as _i1;
import 'theme_page.dart' as _i10;

class RootRouter extends _i14.RootStackRouter {
  RootRouter([_i15.GlobalKey<_i15.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    HomeRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomePage());
    },
    VideoRoute.name: (routeData) {
      final args = routeData.argsAs<VideoRouteArgs>();
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.VideoPage(videoConfig: args.videoConfig, key: args.key));
    },
    VideoConfigRoute.name: (routeData) {
      final args = routeData.argsAs<VideoConfigRouteArgs>();
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.VideoConfigPage(meetingId: args.meetingId, key: args.key));
    },
    CreatePostRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.CreatePostPage());
    },
    DetailPostRoute.name: (routeData) {
      final args = routeData.argsAs<DetailPostRouteArgs>();
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.DetailPostPage(
              postId: args.postId,
              isGoingToComment: args.isGoingToComment,
              key: args.key));
    },
    AuthenticationRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.AuthenticationPage());
    },
    UserRoute.name: (routeData) {
      final args = routeData.argsAs<UserRouteArgs>();
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.UserPage(userId: args.userId, key: args.key));
    },
    LocaleRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.LocalePage());
    },
    ThemeRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.ThemePage());
    },
    SettingsRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.SettingsPage());
    },
    MessageRoute.name: (routeData) {
      final args = routeData.argsAs<MessageRouteArgs>();
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i12.MessagePage(
              conversationId: args.conversationId,
              isGoingToMessage: args.isGoingToMessage,
              userIds: args.userIds,
              key: args.key));
    },
    RequireAuthenticationRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.RequireAuthenticationPage());
    }
  };

  @override
  List<_i14.RouteConfig> get routes => [
        _i14.RouteConfig(SplashRoute.name, path: '/'),
        _i14.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i14.RouteConfig(VideoRoute.name, path: '/video-page'),
        _i14.RouteConfig(VideoConfigRoute.name, path: '/video-config-page'),
        _i14.RouteConfig(CreatePostRoute.name, path: '/create-post-page'),
        _i14.RouteConfig(DetailPostRoute.name, path: '/detail-post-page'),
        _i14.RouteConfig(AuthenticationRoute.name,
            path: '/authentication-page'),
        _i14.RouteConfig(UserRoute.name, path: '/user-page'),
        _i14.RouteConfig(LocaleRoute.name, path: '/locale-page'),
        _i14.RouteConfig(ThemeRoute.name, path: '/theme-page'),
        _i14.RouteConfig(SettingsRoute.name, path: '/settings-page'),
        _i14.RouteConfig(MessageRoute.name, path: '/message-page'),
        _i14.RouteConfig(RequireAuthenticationRoute.name,
            path: '/require-authentication-page')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i14.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i14.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-page');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.VideoPage]
class VideoRoute extends _i14.PageRouteInfo<VideoRouteArgs> {
  VideoRoute({required _i16.VideoConfig videoConfig, _i15.Key? key})
      : super(VideoRoute.name,
            path: '/video-page',
            args: VideoRouteArgs(videoConfig: videoConfig, key: key));

  static const String name = 'VideoRoute';
}

class VideoRouteArgs {
  const VideoRouteArgs({required this.videoConfig, this.key});

  final _i16.VideoConfig videoConfig;

  final _i15.Key? key;

  @override
  String toString() {
    return 'VideoRouteArgs{videoConfig: $videoConfig, key: $key}';
  }
}

/// generated route for
/// [_i4.VideoConfigPage]
class VideoConfigRoute extends _i14.PageRouteInfo<VideoConfigRouteArgs> {
  VideoConfigRoute({required String meetingId, _i15.Key? key})
      : super(VideoConfigRoute.name,
            path: '/video-config-page',
            args: VideoConfigRouteArgs(meetingId: meetingId, key: key));

  static const String name = 'VideoConfigRoute';
}

class VideoConfigRouteArgs {
  const VideoConfigRouteArgs({required this.meetingId, this.key});

  final String meetingId;

  final _i15.Key? key;

  @override
  String toString() {
    return 'VideoConfigRouteArgs{meetingId: $meetingId, key: $key}';
  }
}

/// generated route for
/// [_i5.CreatePostPage]
class CreatePostRoute extends _i14.PageRouteInfo<void> {
  const CreatePostRoute()
      : super(CreatePostRoute.name, path: '/create-post-page');

  static const String name = 'CreatePostRoute';
}

/// generated route for
/// [_i6.DetailPostPage]
class DetailPostRoute extends _i14.PageRouteInfo<DetailPostRouteArgs> {
  DetailPostRoute(
      {required String postId, required bool isGoingToComment, _i15.Key? key})
      : super(DetailPostRoute.name,
            path: '/detail-post-page',
            args: DetailPostRouteArgs(
                postId: postId, isGoingToComment: isGoingToComment, key: key));

  static const String name = 'DetailPostRoute';
}

class DetailPostRouteArgs {
  const DetailPostRouteArgs(
      {required this.postId, required this.isGoingToComment, this.key});

  final String postId;

  final bool isGoingToComment;

  final _i15.Key? key;

  @override
  String toString() {
    return 'DetailPostRouteArgs{postId: $postId, isGoingToComment: $isGoingToComment, key: $key}';
  }
}

/// generated route for
/// [_i7.AuthenticationPage]
class AuthenticationRoute extends _i14.PageRouteInfo<void> {
  const AuthenticationRoute()
      : super(AuthenticationRoute.name, path: '/authentication-page');

  static const String name = 'AuthenticationRoute';
}

/// generated route for
/// [_i8.UserPage]
class UserRoute extends _i14.PageRouteInfo<UserRouteArgs> {
  UserRoute({required String userId, _i15.Key? key})
      : super(UserRoute.name,
            path: '/user-page', args: UserRouteArgs(userId: userId, key: key));

  static const String name = 'UserRoute';
}

class UserRouteArgs {
  const UserRouteArgs({required this.userId, this.key});

  final String userId;

  final _i15.Key? key;

  @override
  String toString() {
    return 'UserRouteArgs{userId: $userId, key: $key}';
  }
}

/// generated route for
/// [_i9.LocalePage]
class LocaleRoute extends _i14.PageRouteInfo<void> {
  const LocaleRoute() : super(LocaleRoute.name, path: '/locale-page');

  static const String name = 'LocaleRoute';
}

/// generated route for
/// [_i10.ThemePage]
class ThemeRoute extends _i14.PageRouteInfo<void> {
  const ThemeRoute() : super(ThemeRoute.name, path: '/theme-page');

  static const String name = 'ThemeRoute';
}

/// generated route for
/// [_i11.SettingsPage]
class SettingsRoute extends _i14.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '/settings-page');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i12.MessagePage]
class MessageRoute extends _i14.PageRouteInfo<MessageRouteArgs> {
  MessageRoute(
      {required String? conversationId,
      required bool isGoingToMessage,
      required List<String> userIds,
      _i15.Key? key})
      : super(MessageRoute.name,
            path: '/message-page',
            args: MessageRouteArgs(
                conversationId: conversationId,
                isGoingToMessage: isGoingToMessage,
                userIds: userIds,
                key: key));

  static const String name = 'MessageRoute';
}

class MessageRouteArgs {
  const MessageRouteArgs(
      {required this.conversationId,
      required this.isGoingToMessage,
      required this.userIds,
      this.key});

  final String? conversationId;

  final bool isGoingToMessage;

  final List<String> userIds;

  final _i15.Key? key;

  @override
  String toString() {
    return 'MessageRouteArgs{conversationId: $conversationId, isGoingToMessage: $isGoingToMessage, userIds: $userIds, key: $key}';
  }
}

/// generated route for
/// [_i13.RequireAuthenticationPage]
class RequireAuthenticationRoute extends _i14.PageRouteInfo<void> {
  const RequireAuthenticationRoute()
      : super(RequireAuthenticationRoute.name,
            path: '/require-authentication-page');

  static const String name = 'RequireAuthenticationRoute';
}
