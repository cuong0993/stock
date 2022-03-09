import 'package:application/authentication/authentication_state.dart';
import 'package:application/providers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'root_router.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authenticationProvider, (_, state) {
      if (state is AuthenticationStateAuthenticated ||
          state is AuthenticationStateUnauthenticated) {
        AutoRouter.of(context).replace(const HomeRoute());
      }
    });

    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          'assets/images/img_app_icon.svg',
        ),
      ),
    );
  }
}
