import 'package:auto_route/auto_route.dart';

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
    AutoRoute<void>(
      initial: true,
      page: SplashPage,
    ),
    AutoRoute<void>(
      page: HomePage,
    ),
    AutoRoute<void>(
      page: CreatePostPage,
    ),
    AutoRoute<void>(
      page: DetailPostPage,
    ),
    AutoRoute<void>(
      page: AuthenticationPage,
    ),
    AutoRoute<void>(
      page: UserPage,
    ),
    AutoRoute<void>(
      page: LocalePage,
    ),
    AutoRoute<void>(
      page: ThemePage,
    ),
    AutoRoute<void>(
      page: SettingsPage,
    ),
    AutoRoute<void>(
      page: MessagePage,
    ),
    AutoRoute<void>(
      page: RequireAuthenticationPage,
    ),
  ],
)
class $RootRouter {}
