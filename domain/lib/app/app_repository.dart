abstract class AppRepository {
  String? getLocaleName();

  Future<void> setLocaleName(String localeName);

  String? getThemeName();

  Future<void> setThemeName(String themeName);
}
