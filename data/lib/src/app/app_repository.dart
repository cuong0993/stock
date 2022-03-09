import 'package:domain/app/app_repository.dart' as domain;
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'shared_preferences_extension.dart';

@LazySingleton(as: domain.AppRepository)
class AppRepository extends domain.AppRepository {
  AppRepository(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  @override
  String? getLocaleName() => _sharedPreferences.getLocaleName();

  @override
  String? getThemeName() => _sharedPreferences.getThemeName();

  @override
  Future<void> setLocaleName(String localeName) =>
      _sharedPreferences.setLocaleName(localeName);

  @override
  Future<void> setThemeName(String themeName) =>
      _sharedPreferences.setThemeName(themeName);
}
