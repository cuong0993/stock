import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../authentication/authentication_page.dart';
import '../user/user_page.dart';
import 'home_page.dart';
import 'locale_page.dart';
import 'settings_page.dart';
import 'splash_page.dart';
import 'theme_page.dart';

part 'routes.g.dart';

@TypedGoRoute<SplashRoute>(
  path: '/splash',
)
@immutable
// ignore: prefer-match-file-name
class SplashRoute extends GoRouteData {
  @override
  Widget build(BuildContext context) => const SplashPage();
}

@TypedGoRoute<HomeRoute>(
  path: '/',
)
@immutable
class HomeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context) => const HomePage();
}

@TypedGoRoute<AuthenticationRoute>(
  path: '/signin',
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
