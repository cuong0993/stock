// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;

import '../authentication/authentication_page.dart' as _i5;
import '../authentication/require_authentication_page.dart' as _i11;
import '../conversation/message_page.dart' as _i10;
import '../post/create/create_post_page.dart' as _i3;
import '../post/detail_post_page.dart' as _i4;
import '../user/user_page.dart' as _i6;
import 'home_page.dart' as _i2;
import 'locale_page.dart' as _i7;
import 'settings_page.dart' as _i9;
import 'splash_page.dart' as _i1;
import 'theme_page.dart' as _i8;

class RootRouter extends _i12.RootStackRouter {
  RootRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i12.MaterialPageX<void>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    HomeRoute.name: (routeData) {
      return _i12.MaterialPageX<void>(
          routeData: routeData, child: const _i2.HomePage());
    },
    CreatePostRoute.name: (routeData) {
      return _i12.MaterialPageX<void>(
          routeData: routeData, child: const _i3.CreatePostPage());
    },
    DetailPostRoute.name: (routeData) {
      final args = routeData.argsAs<DetailPostRouteArgs>();
      return _i12.MaterialPageX<void>(
          routeData: routeData,
          child: _i4.DetailPostPage(
              postId: args.postId,
              isGoingToComment: args.isGoingToComment,
              key: args.key));
    },
    AuthenticationRoute.name: (routeData) {
      return _i12.MaterialPageX<void>(
          routeData: routeData, child: const _i5.AuthenticationPage());
    },
    UserRoute.name: (routeData) {
      final args = routeData.argsAs<UserRouteArgs>();
      return _i12.MaterialPageX<void>(
          routeData: routeData,
          child: _i6.UserPage(userId: args.userId, key: args.key));
    },
    LocaleRoute.name: (routeData) {
      return _i12.MaterialPageX<void>(
          routeData: routeData, child: const _i7.LocalePage());
    },
    ThemeRoute.name: (routeData) {
      return _i12.MaterialPageX<void>(
          routeData: routeData, child: const _i8.ThemePage());
    },
    SettingsRoute.name: (routeData) {
      return _i12.MaterialPageX<void>(
          routeData: routeData, child: const _i9.SettingsPage());
    },
    MessageRoute.name: (routeData) {
      final args = routeData.argsAs<MessageRouteArgs>();
      return _i12.MaterialPageX<void>(
          routeData: routeData,
          child: _i10.MessagePage(
              conversationId: args.conversationId,
              isGoingToMessage: args.isGoingToMessage,
              userIds: args.userIds,
              key: args.key));
    },
    RequireAuthenticationRoute.name: (routeData) {
      return _i12.MaterialPageX<void>(
          routeData: routeData, child: const _i11.RequireAuthenticationPage());
    }
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(SplashRoute.name, path: '/'),
        _i12.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i12.RouteConfig(CreatePostRoute.name, path: '/create-post-page'),
        _i12.RouteConfig(DetailPostRoute.name, path: '/detail-post-page'),
        _i12.RouteConfig(AuthenticationRoute.name,
            path: '/authentication-page'),
        _i12.RouteConfig(UserRoute.name, path: '/user-page'),
        _i12.RouteConfig(LocaleRoute.name, path: '/locale-page'),
        _i12.RouteConfig(ThemeRoute.name, path: '/theme-page'),
        _i12.RouteConfig(SettingsRoute.name, path: '/settings-page'),
        _i12.RouteConfig(MessageRoute.name, path: '/message-page'),
        _i12.RouteConfig(RequireAuthenticationRoute.name,
            path: '/require-authentication-page')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i12.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-page');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.CreatePostPage]
class CreatePostRoute extends _i12.PageRouteInfo<void> {
  const CreatePostRoute()
      : super(CreatePostRoute.name, path: '/create-post-page');

  static const String name = 'CreatePostRoute';
}

/// generated route for
/// [_i4.DetailPostPage]
class DetailPostRoute extends _i12.PageRouteInfo<DetailPostRouteArgs> {
  DetailPostRoute(
      {required String postId, required bool isGoingToComment, _i13.Key? key})
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

  final _i13.Key? key;

  @override
  String toString() {
    return 'DetailPostRouteArgs{postId: $postId, isGoingToComment: $isGoingToComment, key: $key}';
  }
}

/// generated route for
/// [_i5.AuthenticationPage]
class AuthenticationRoute extends _i12.PageRouteInfo<void> {
  const AuthenticationRoute()
      : super(AuthenticationRoute.name, path: '/authentication-page');

  static const String name = 'AuthenticationRoute';
}

/// generated route for
/// [_i6.UserPage]
class UserRoute extends _i12.PageRouteInfo<UserRouteArgs> {
  UserRoute({required String userId, _i13.Key? key})
      : super(UserRoute.name,
            path: '/user-page', args: UserRouteArgs(userId: userId, key: key));

  static const String name = 'UserRoute';
}

class UserRouteArgs {
  const UserRouteArgs({required this.userId, this.key});

  final String userId;

  final _i13.Key? key;

  @override
  String toString() {
    return 'UserRouteArgs{userId: $userId, key: $key}';
  }
}

/// generated route for
/// [_i7.LocalePage]
class LocaleRoute extends _i12.PageRouteInfo<void> {
  const LocaleRoute() : super(LocaleRoute.name, path: '/locale-page');

  static const String name = 'LocaleRoute';
}

/// generated route for
/// [_i8.ThemePage]
class ThemeRoute extends _i12.PageRouteInfo<void> {
  const ThemeRoute() : super(ThemeRoute.name, path: '/theme-page');

  static const String name = 'ThemeRoute';
}

/// generated route for
/// [_i9.SettingsPage]
class SettingsRoute extends _i12.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '/settings-page');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i10.MessagePage]
class MessageRoute extends _i12.PageRouteInfo<MessageRouteArgs> {
  MessageRoute(
      {required String? conversationId,
      required bool isGoingToMessage,
      required List<String> userIds,
      _i13.Key? key})
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

  final _i13.Key? key;

  @override
  String toString() {
    return 'MessageRouteArgs{conversationId: $conversationId, isGoingToMessage: $isGoingToMessage, userIds: $userIds, key: $key}';
  }
}

/// generated route for
/// [_i11.RequireAuthenticationPage]
class RequireAuthenticationRoute extends _i12.PageRouteInfo<void> {
  const RequireAuthenticationRoute()
      : super(RequireAuthenticationRoute.name,
            path: '/require-authentication-page');

  static const String name = 'RequireAuthenticationRoute';
}
