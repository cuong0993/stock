import 'package:domain/user/user.dart';
import 'package:domain/user/user_repository.dart';
import 'package:riverpod/riverpod.dart';

class UserController extends StateNotifier<AsyncValue<User>> {
  UserController(this.userId, this._userRepository)
      : super(const AsyncValue.loading()) {
    Future.microtask(() async {
      final user = await _userRepository.getUser(userId);
      user.fold(
        (_) {
          state = const AsyncValue.error('Not found');
        },
        (user) {
          state = AsyncValue.data(user);
        },
      );
    });
  }

  final String userId;
  final UserRepository _userRepository;
}
