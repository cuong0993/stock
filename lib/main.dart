import 'package:data/service_locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';

import 'app/app.dart';
import 'app/log_provider_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
