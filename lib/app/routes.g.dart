// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $splashRoute,
      $homeRoute,
      $authenticationRoute,
      $userRoute,
      $localeRoute,
      $themeRoute,
      $settingsRoute,
    ];

GoRoute get $splashRoute => GoRouteData.$route(
      path: '/splash',
      factory: $SplashRouteExtension._fromState,
    );

extension $SplashRouteExtension on SplashRoute {
  static SplashRoute _fromState(GoRouterState state) => SplashRoute();

  String get location => GoRouteData.$location(
        '/splash',
      );

  void go(BuildContext context) => context.go(location, extra: this);
}

GoRoute get $homeRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeRouteExtension._fromState,
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location, extra: this);
}

GoRoute get $authenticationRoute => GoRouteData.$route(
      path: '/signin',
      factory: $AuthenticationRouteExtension._fromState,
    );

extension $AuthenticationRouteExtension on AuthenticationRoute {
  static AuthenticationRoute _fromState(GoRouterState state) =>
      AuthenticationRoute();

  String get location => GoRouteData.$location(
        '/signin',
      );

  void go(BuildContext context) => context.go(location, extra: this);
}

GoRoute get $userRoute => GoRouteData.$route(
      path: '/user/:userId',
      factory: $UserRouteExtension._fromState,
    );

extension $UserRouteExtension on UserRoute {
  static UserRoute _fromState(GoRouterState state) => UserRoute(
        userId: state.params['userId']!,
      );

  String get location => GoRouteData.$location(
        '/user/${Uri.encodeComponent(userId)}',
      );

  void go(BuildContext context) => context.go(location, extra: this);
}

GoRoute get $localeRoute => GoRouteData.$route(
      path: '/locale',
      factory: $LocaleRouteExtension._fromState,
    );

extension $LocaleRouteExtension on LocaleRoute {
  static LocaleRoute _fromState(GoRouterState state) => LocaleRoute();

  String get location => GoRouteData.$location(
        '/locale',
      );

  void go(BuildContext context) => context.go(location, extra: this);
}

GoRoute get $themeRoute => GoRouteData.$route(
      path: '/theme',
      factory: $ThemeRouteExtension._fromState,
    );

extension $ThemeRouteExtension on ThemeRoute {
  static ThemeRoute _fromState(GoRouterState state) => ThemeRoute();

  String get location => GoRouteData.$location(
        '/theme',
      );

  void go(BuildContext context) => context.go(location, extra: this);
}

GoRoute get $settingsRoute => GoRouteData.$route(
      path: '/settings',
      factory: $SettingsRouteExtension._fromState,
    );

extension $SettingsRouteExtension on SettingsRoute {
  static SettingsRoute _fromState(GoRouterState state) => SettingsRoute();

  String get location => GoRouteData.$location(
        '/settings',
      );

  void go(BuildContext context) => context.go(location, extra: this);
}
