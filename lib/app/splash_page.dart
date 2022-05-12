import 'package:application/authentication/authentication_state.dart';
import 'package:application/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'routes.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authenticationProvider, (_, state) {
      if (state is AuthenticationStateAuthenticated ||
          state is AuthenticationStateUnauthenticated) {
        HomeRoute().go(context);
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
