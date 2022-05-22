import 'package:domain/user/user.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod/riverpod.dart';

import 'app/app_controller.dart';
import 'app/app_state.dart';
import 'authentication/authenticated_user_controller.dart';
import 'authentication/authentication_controller.dart';
import 'authentication/authentication_state.dart';
import 'user/edit/edit_user_controller.dart';
import 'user/edit/edit_user_state.dart';
import 'user/user_controller.dart';

final authenticationProvider =
    StateNotifierProvider<AuthenticationController, AuthenticationState>(
  (ref) => AuthenticationController(GetIt.instance()),
);

final myUserProvider =
    StateNotifierProvider<AuthenticatedUserController, AsyncValue<User>>((ref) {
  ref.watch(authenticationProvider);

  return AuthenticatedUserController(GetIt.instance(), GetIt.instance());
});

final userOfIdProvider = StateNotifierProvider.autoDispose
    .family<UserController, AsyncValue<User>, String>(
  (ref, userId) => UserController(userId, GetIt.instance()),
);

final editUserControllerProvider = StateNotifierProvider.autoDispose
    .family<EditUserController, EditUserState, User>(
  (ref, user) => EditUserController(user),
);

final appProvider = StateNotifierProvider.autoDispose<AppController, AppState>(
  (ref) => AppController(GetIt.instance()),
);
