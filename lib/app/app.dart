import 'package:application/providers.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'routes.dart';
import 'theme.dart';

class App extends ConsumerWidget {
  App({Key? key}) : super(key: key);

  final _router = GoRouter(
    routes: $appRoutes,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appProvider);

    return MaterialApp.router(
      title: 'Stock',
      debugShowCheckedModeBanner: false,
      locale: (appState.localeName != null)
          ? Locale.fromSubtags(languageCode: appState.localeName!)
          : null,
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      themeMode: ThemeMode.values.firstWhere(
        (element) => element.name == appState.themeName,
        orElse: () => ThemeMode.system,
      ),
      theme: lightTheme,
      darkTheme: darkTheme,
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
    );
  }
}
