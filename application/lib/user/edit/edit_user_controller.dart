import 'package:domain/user/user.dart';
import 'package:riverpod/riverpod.dart';

import 'edit_user_state.dart';

class EditUserController extends StateNotifier<EditUserState> {
  EditUserController(User user)
      : super(EditUserState(user: user, newProfileImagePath: null));

  void editUser() {
    // TODO
  }

  void setImage(String path) {
    state = state.copyWith(newProfileImagePath: path);
  }

  void setBio(String _) {
    // TODO
  }

  void setUsername(String _) {
    // TODO
  }
}
