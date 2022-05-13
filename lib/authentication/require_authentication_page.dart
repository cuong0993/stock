import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:go_router/go_router.dart';

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
            context.push(AuthenticationRoute().location);
          },
          child: Text(L10n.of(context)!.login),
        ),
      );
}
