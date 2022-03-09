import 'package:application/providers.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const localeStrings = {
  'en': 'English',
  'ko': '한국어',
  'vi': 'Tiếng Việt',
  'zh': '汉语',
};

class LocalePage extends ConsumerWidget {
  const LocalePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        appBar: AppBar(
          title: Text(
            L10n.of(context)!.language,
          ),
        ),
        body: Scrollbar(
          isAlwaysShown: true,
          child: ListView.builder(
            itemCount: L10n.supportedLocales.length,
            itemBuilder: (context, index) => RadioListTile<Locale>(
              title: Text(
                localeStrings[L10n.supportedLocales[index].languageCode]!,
              ),
              value: L10n.supportedLocales[index],
              groupValue: Localizations.localeOf(context),
              onChanged: (value) {
                ref
                    .read(appProvider.notifier)
                    .setLocaleName(value!.toLanguageTag());
              },
            ),
          ),
        ),
      );
}
