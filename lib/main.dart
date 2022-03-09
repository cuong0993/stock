import 'dart:io';

import 'package:data/service_locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:window_size/window_size.dart' as window_size;

import 'app/app.dart';
import 'app/log_provider_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      final appName = (await PackageInfo.fromPlatform()).appName;
      window_size.setWindowMaxSize(const Size(720, 1080));
      window_size.setWindowMinSize(const Size(720, 720));
      window_size.setWindowTitle(appName);
    }
  }
  await configureServiceLocator('');
  if (kReleaseMode) {
    runApp(
      ProviderScope(
        child: App(),
      ),
    );
  } else {
    Logger.root.onRecord.listen((record) {
      // ignore: avoid_print
      print('${record.level.name}: ${record.time}: ${record.message}');
    });
    runApp(
      ProviderScope(
        observers: [LogProviderObserver()],
        child: App(),
      ),
    );
  }
}
