// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $splashRoute,
      $homeRoute,
      $createPostRoute,
      $detailPostRoute,
      $authenticationRoute,
      $userRoute,
      $localeRoute,
      $themeRoute,
      $settingsRoute,
      $requireAuthenticationRoute,
    ];

GoRoute get $splashRoute => GoRouteData.$route(
      path: '/',
      factory: $SplashRouteExtension._fromState,
    );

extension $SplashRouteExtension on SplashRoute {
  static SplashRoute _fromState(GoRouterState state) => SplashRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location, extra: this);
}

GoRoute get $homeRoute => GoRouteData.$route(
      path: '/home',
      factory: $HomeRouteExtension._fromState,
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => HomeRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location, extra: this);
}

GoRoute get $createPostRoute => GoRouteData.$route(
      path: '/create-post',
      factory: $CreatePostRouteExtension._fromState,
    );

extension $CreatePostRouteExtension on CreatePostRoute {
  static CreatePostRoute _fromState(GoRouterState state) => CreatePostRoute();

  String get location => GoRouteData.$location(
        '/create-post',
      );

  void go(BuildContext context) => context.go(location, extra: this);
}

GoRoute get $detailPostRoute => GoRouteData.$route(
      path: '/detail-post/:postId',
      factory: $DetailPostRouteExtension._fromState,
    );

extension $DetailPostRouteExtension on DetailPostRoute {
  static DetailPostRoute _fromState(GoRouterState state) => DetailPostRoute(
        postId: state.params['postId']!,
      );

  String get location => GoRouteData.$location(
        '/detail-post/${Uri.encodeComponent(postId)}',
      );

  void go(BuildContext context) => context.go(location, extra: this);
}

GoRoute get $authenticationRoute => GoRouteData.$route(
      path: '/authentication',
      factory: $AuthenticationRouteExtension._fromState,
    );

extension $AuthenticationRouteExtension on AuthenticationRoute {
  static AuthenticationRoute _fromState(GoRouterState state) =>
      AuthenticationRoute();

  String get location => GoRouteData.$location(
        '/authentication',
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

GoRoute get $requireAuthenticationRoute => GoRouteData.$route(
      path: '/require-authentication',
      factory: $RequireAuthenticationRouteExtension._fromState,
    );

extension $RequireAuthenticationRouteExtension on RequireAuthenticationRoute {
  static RequireAuthenticationRoute _fromState(GoRouterState state) =>
      RequireAuthenticationRoute();

  String get location => GoRouteData.$location(
        '/require-authentication',
      );

  void go(BuildContext context) => context.go(location, extra: this);
}
