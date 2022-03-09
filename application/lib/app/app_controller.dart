import 'package:domain/app/app_repository.dart';
import 'package:riverpod/riverpod.dart';

import 'app_state.dart';

class AppController extends StateNotifier<AppState> {
  AppController(this._preference)
      : super(AppState(themeName: null, localeName: null)) {
    final localeName = _preference.getLocaleName();
    final themeName = _preference.getThemeName();
    state = state.copyWith(
      themeName: themeName,
      localeName: localeName,
    );
  }

  final AppRepository _preference;

  Future<void> setLocaleName(String localeName) async {
    await _preference.setLocaleName(localeName);
    state = state.copyWith(localeName: localeName);
  }

  Future<void> setThemeName(String themeName) async {
    await _preference.setThemeName(themeName);
    state = state.copyWith(themeName: themeName);
  }
}
