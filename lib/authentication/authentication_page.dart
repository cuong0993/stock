import 'package:application/authentication/authentication_state.dart';
import 'package:application/providers.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthenticationPage extends ConsumerWidget {
  const AuthenticationPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authenticationProvider, (_, state) {
      if (state is AuthenticationStateAuthenticated) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          L10n.of(context)!.login,
        ),
      ),
      body: Card(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              OutlinedButton(
                onPressed:
                    ref.read(authenticationProvider.notifier).signInWithGoogle,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: <Widget>[
                      SvgPicture.asset(
                        'assets/images/img_google.svg',
                      ),
                      const SizedBox(width: 8),
                      Text(
                        L10n.of(context)!.button_sign_in_google,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              OutlinedButton(
                onPressed: ref
                    .read(authenticationProvider.notifier)
                    .signInWithFacebook,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: <Widget>[
                      SvgPicture.asset(
                        'assets/images/img_facebook.svg',
                      ),
                      const SizedBox(width: 8),
                      Text(
                        L10n.of(context)!.button_sign_in_facebook,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
