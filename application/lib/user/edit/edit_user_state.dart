import 'package:domain/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_user_state.freezed.dart';

@freezed
class EditUserState with _$EditUserState {
  factory EditUserState({
    required String? newProfileImagePath,
    required User user,
  }) = _EditUserState;
}
