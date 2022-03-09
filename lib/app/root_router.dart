import 'package:auto_route/auto_route.dart';

import '../authentication/authentication_page.dart';
import '../authentication/require_authentication_page.dart';
import '../conversation/message_page.dart';
import '../post/create/create_post_page.dart';
import '../post/detail_post_page.dart';
import '../user/user_page.dart';
import '../video/video_config_page.dart';
import '../video/video_page.dart';
import 'home_page.dart';
import 'locale_page.dart';
import 'settings_page.dart';
import 'splash_page.dart';
import 'theme_page.dart';

export 'root_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute<dynamic>>[
    AutoRoute<dynamic>(
      initial: true,
      page: SplashPage,
    ),
    AutoRoute<dynamic>(
      page: HomePage,
    ),
    AutoRoute<dynamic>(
      page: VideoPage,
    ),
    AutoRoute<dynamic>(
      page: VideoConfigPage,
    ),
    AutoRoute<dynamic>(
      page: CreatePostPage,
    ),
    AutoRoute<dynamic>(
      page: DetailPostPage,
    ),
    AutoRoute<dynamic>(
      page: AuthenticationPage,
    ),
    AutoRoute<dynamic>(
      page: UserPage,
    ),
    AutoRoute<dynamic>(
      page: LocalePage,
    ),
    AutoRoute<dynamic>(
      page: ThemePage,
    ),
    AutoRoute<dynamic>(
      page: SettingsPage,
    ),
    AutoRoute<dynamic>(
      page: MessagePage,
    ),
    AutoRoute<dynamic>(
      page: RequireAuthenticationPage,
    ),
  ],
)
class $RootRouter {}
