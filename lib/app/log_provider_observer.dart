import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';

class LogProviderObserver extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase provider,
    Object? value,
    ProviderContainer container,
  ) {
    Logger.root.info(
      '''
Add
{
  "provider": "$provider",
  "value": "$value"
}''',
    );
  }

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    Logger.root.info(
      '''
Update
{
  "provider": "$provider",
  "newValue": "$newValue"
}''',
    );
  }

  @override
  void didDisposeProvider(
    ProviderBase provider,
    ProviderContainer containers,
  ) {
    Logger.root.info(
      '''
Dispose
{
  "provider": "$provider"
}''',
    );
  }
}
