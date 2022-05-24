import 'package:application/authentication/authentication_state.dart';
import 'package:application/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthenticationPage extends ConsumerWidget {
  const AuthenticationPage({
    super.key,
  });

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
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: (Theme.of(context).brightness == Brightness.dark)
                    ? const Color(0xff4285f4)
                    : const Color(0xffffffff),
                padding: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
              ),
              onPressed:
                  ref.read(authenticationProvider.notifier).signInWithGoogle,
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/images/google.svg',
                    ),
                    Expanded(
                      child: Text(
                        L10n.of(context)!.sign_in_with_google,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color:
                              (Theme.of(context).brightness == Brightness.dark)
                                  ? const Color(0xffffffff)
                                  : const Color(0xff000000),
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xff1877F2),
                padding: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
              ),
              onPressed:
                  ref.read(authenticationProvider.notifier).signInWithFacebook,
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/images/facebook.svg',
                    ),
                    Expanded(
                      child: Text(
                        L10n.of(context)!.sign_in_with_facebook,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
