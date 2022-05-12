import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/l10n.dart';
import '../app/routes.dart';

class RequireAuthenticationPage extends StatelessWidget {
  const RequireAuthenticationPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(L10n.of(context)!.require_login),
        ),
        body: TextButton(
          onPressed: () {
            AuthenticationRoute().go(context);
          },
          child: Text(L10n.of(context)!.login),
        ),
      );
}
