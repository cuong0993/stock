import 'package:application/providers.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemePage extends ConsumerWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        appBar: AppBar(
          title: Text(
            L10n.of(context)!.theme,
          ),
        ),
        body: Consumer(
          builder: (context, ref, child) {
            final themeName = ref.watch(appProvider).themeName;

            return Scrollbar(
              thumbVisibility: true,
              child: ListView.builder(
                itemCount: ThemeMode.values.length,
                itemBuilder: (context, index) => RadioListTile<ThemeMode>(
                  title: Text(
                    getThemeName(context, ThemeMode.values[index].name),
                  ),
                  value: ThemeMode.values[index],
                  groupValue: ThemeMode.values.firstWhere(
                    (element) => element.name == themeName,
                    orElse: () => ThemeMode.system,
                  ),
                  onChanged: (value) {
                    ref.read(appProvider.notifier).setThemeName(value!.name);
                  },
                ),
              ),
            );
          },
        ),
      );
}

String getThemeName(BuildContext context, String? themeName) {
  if (themeName == ThemeMode.dark.name) {
    return L10n.of(context)!.dark;
  } else if (themeName == ThemeMode.light.name) {
    return L10n.of(context)!.light;
  } else {
    return L10n.of(context)!.system;
  }
}
