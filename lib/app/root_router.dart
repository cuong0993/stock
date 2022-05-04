import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

import '../authentication/authentication_page.dart';
import '../authentication/require_authentication_page.dart';
import '../conversation/message_page.dart';
import '../post/create/create_post_page.dart';
import '../post/detail_post_page.dart';
import '../user/user_page.dart';
import 'home_page.dart';
import 'locale_page.dart';
import 'settings_page.dart';
import 'splash_page.dart';
import 'theme_page.dart';

export 'root_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute<Widget>(
      initial: true,
      page: SplashPage,
    ),
    AutoRoute<Widget>(
      page: HomePage,
    ),
    AutoRoute<Widget>(
      page: CreatePostPage,
    ),
    AutoRoute<Widget>(
      page: DetailPostPage,
    ),
    AutoRoute<Widget>(
      page: AuthenticationPage,
    ),
    AutoRoute<Widget>(
      page: UserPage,
    ),
    AutoRoute<Widget>(
      page: LocalePage,
    ),
    AutoRoute<Widget>(
      page: ThemePage,
    ),
    AutoRoute<Widget>(
      page: SettingsPage,
    ),
    AutoRoute<Widget>(
      page: MessagePage,
    ),
    AutoRoute<Widget>(
      page: RequireAuthenticationPage,
    ),
  ],
)
class $RootRouter {}
