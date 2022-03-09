import 'package:domain/authentication/authentication_repository.dart';
import 'package:riverpod/riverpod.dart';

import 'authentication_state.dart';

class AuthenticationController extends StateNotifier<AuthenticationState> {
  AuthenticationController(this._authenticationRepository)
      : super(AuthenticationState.loading()) {
    Future.microtask(() {
      _authenticationRepository.getUserId().fold(
        () {
          state = AuthenticationState.unauthenticated();
        },
        (_) {
          state = AuthenticationState.authenticated();
        },
      );
    });
  }

  final AuthenticationRepository _authenticationRepository;

  Future<void> signInWithGoogle() async {
    (await _authenticationRepository.signInWithGoogle()).fold(
      (_) {
        state = AuthenticationState.unauthenticated();
      },
      (_) {
        state = AuthenticationState.authenticated();
      },
    );
  }

  Future<void> signInWithFacebook() async {
    (await _authenticationRepository.signInWithFacebook()).fold(
      (_) {
        state = AuthenticationState.unauthenticated();
      },
      (_) {
        state = AuthenticationState.authenticated();
      },
    );
  }
}
