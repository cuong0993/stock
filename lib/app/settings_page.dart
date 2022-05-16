import 'dart:io';

import 'package:application/providers.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:mailto/mailto.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'locale_page.dart';
import 'routes.dart';
import 'theme_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            L10n.of(context)!.settings,
          ),
        ),
        body: ListView(
          children: [
            ListTile(
              title: Text(
                L10n.of(context)!.language,
              ),
              subtitle: Text(
                localeStrings[Localizations.localeOf(context).languageCode]!,
              ),
              onTap: () {
                context.push(LocaleRoute().location);
              },
            ),
            ListTile(
              title: Text(
                L10n.of(context)!.theme,
              ),
              subtitle: Consumer(
                builder: (context, ref, child) {
                  final themeName = ref.watch(appProvider).themeName;

                  return Text(
                    getThemeName(context, themeName),
                  );
                },
              ),
              onTap: () {
                context.push(ThemeRoute().location);
              },
            ),
            ListTile(
              title: Text(
                L10n.of(context)!.button_feedback,
              ),
              onTap: () async {
                final packageInfo = await PackageInfo.fromPlatform();
                final appName = packageInfo.appName;
                final version = packageInfo.version;
                final buildNumber = packageInfo.buildNumber;
                var deviceInfo = '';
                if (Platform.isAndroid) {
                  final info = await DeviceInfoPlugin().androidInfo;
                  final release = info.version.release;
                  final sdkInt = info.version.sdkInt;
                  final manufacturer = info.manufacturer;
                  final model = info.model;
                  deviceInfo =
                      'Android $release (SDK $sdkInt), $manufacturer $model';
                }

                if (Platform.isIOS) {
                  final info = await DeviceInfoPlugin().iosInfo;
                  final systemName = info.systemName;
                  final version = info.systemVersion;
                  final name = info.name;
                  final model = info.model;
                  deviceInfo = '$systemName $version, $name $model';
                }
                final extendedBody = 'Name: $appName\n'
                    'Version code: $buildNumber\n'
                    'Version name: $version\n'
                    'Device: $deviceInfo\n'
                    '---------------------\n';
                final mailtoLink = Mailto(
                  body: extendedBody,
                  subject: '[$appName $version] Feedback',
                  to: ['chaomao.help@gmail.com'],
                );
                await launchUrl(Uri.tryParse('$mailtoLink')!);
              },
            ),
            ListTile(
              title: Text(
                L10n.of(context)!.about_rate,
              ),
              onTap: () async {
                final inAppReview = InAppReview.instance;
                await inAppReview.openStoreListing(
                  appStoreId: '_appStoreId',
                  microsoftStoreId: '_microsoftStoreId',
                );
              },
            ),
          ],
        ),
      );
}
