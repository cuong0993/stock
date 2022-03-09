import 'package:shared_preferences/shared_preferences.dart';

extension SharedPreferencesExtension on SharedPreferences {
  static const preferenceLocaleName = 'LocaleName';
  static const preferenceThemeName = 'ThemeName';

  String? getLocaleName() => getString(preferenceLocaleName);

  Future<void> setLocaleName(String localeName) async {
    await setString(preferenceLocaleName, localeName);
  }

  String? getThemeName() => getString(preferenceThemeName);

  Future<void> setThemeName(String themeName) async {
    await setString(preferenceThemeName, themeName);
  }
}
