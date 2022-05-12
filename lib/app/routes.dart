import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../authentication/authentication_page.dart';
import '../authentication/require_authentication_page.dart';
import '../post/create/create_post_page.dart';
import '../post/detail_post_page.dart';
import '../user/user_page.dart';
import 'home_page.dart';
import 'locale_page.dart';
import 'settings_page.dart';
import 'splash_page.dart';
import 'theme_page.dart';

part 'routes.g.dart';

@TypedGoRoute<SplashRoute>(
  path: '/',
)
@immutable
class SplashRoute extends GoRouteData {
  @override
  Widget build(BuildContext context) => const SplashPage();
}

@TypedGoRoute<HomeRoute>(
  path: '/home',
)
@immutable
class HomeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context) => const HomePage();
}

@TypedGoRoute<CreatePostRoute>(
  path: '/create-post',
)
@immutable
class CreatePostRoute extends GoRouteData {
  @override
  Widget build(BuildContext context) => const CreatePostPage();
}

@TypedGoRoute<DetailPostRoute>(
  path: '/detail-post/:postId',
)
@immutable
class DetailPostRoute extends GoRouteData {
  const DetailPostRoute({
    required this.postId,
  });

  final String postId;

  @override
  Widget build(BuildContext context) => DetailPostPage(
        postId: postId,
        isGoingToComment: true,
      );
}

@TypedGoRoute<AuthenticationRoute>(
  path: '/authentication',
)
@immutable
class AuthenticationRoute extends GoRouteData {
  @override
  Widget build(BuildContext context) => const AuthenticationPage();
}

@TypedGoRoute<UserRoute>(
  path: '/user/:userId',
)
@immutable
class UserRoute extends GoRouteData {
  const UserRoute({
    required this.userId,
  });

  final String userId;

  @override
  Widget build(BuildContext context) => UserPage(
        userId: userId,
      );
}

@TypedGoRoute<LocaleRoute>(
  path: '/locale',
)
@immutable
class LocaleRoute extends GoRouteData {
  @override
  Widget build(BuildContext context) => const LocalePage();
}

@TypedGoRoute<ThemeRoute>(
  path: '/theme',
)
@immutable
class ThemeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context) => const ThemePage();
}

@TypedGoRoute<SettingsRoute>(
  path: '/settings',
)
@immutable
class SettingsRoute extends GoRouteData {
  @override
  Widget build(BuildContext context) => const SettingsPage();
}

@TypedGoRoute<RequireAuthenticationRoute>(
  path: '/require-authentication',
)
@immutable
class RequireAuthenticationRoute extends GoRouteData {
  @override
  Widget build(BuildContext context) => const RequireAuthenticationPage();
}
