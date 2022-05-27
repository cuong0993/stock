import 'dart:async';

import 'package:domain/authentication/authentication_repository.dart';
import 'package:domain/user/user.dart';
import 'package:domain/user/user_repository.dart';
import 'package:riverpod/riverpod.dart';

class AuthenticatedUserController extends StateNotifier<AsyncValue<User>> {
  AuthenticatedUserController(
    this._userRepository,
    this._authenticationRepository,
  ) : super(const AsyncValue.loading()) {
    {
      _authenticationRepository.getUserId().fold(
        () {
          state = const AsyncValue.error('Unauthenticated');
        },
        (userId) {
          _subscription?.cancel();
          _subscription =
              _userRepository.watchUser(userId).listen((user) async {
            await user.fold((_) => null, (data) async {
              await (await _authenticationRepository.getDeviceToken())
                  .fold((_) => null, (token) async {
                if (token != null && !data.tokens.contains(token)) {
                  await _userRepository.addToken(data.id, token);
                }
                state = AsyncValue.data(data);
              });
            });
          });
        },
      );
    }
  }

  StreamSubscription<void>? _subscription;
  final UserRepository _userRepository;
  final AuthenticationRepository _authenticationRepository;

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
