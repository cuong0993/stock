import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'service_locator.config.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> configureServiceLocator(String env) async {
  await $initGetIt(getIt, environment: env);
}
