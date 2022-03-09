import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    required String? themeName,
    required String? localeName,
  }) = _AppState;
}
