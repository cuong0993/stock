import 'dart:async';

import 'package:domain/post/post.dart';
import 'package:domain/post/post_repository.dart';
import 'package:domain/user/user.dart';
import 'package:riverpod/riverpod.dart';

class PostUserController extends StateNotifier<AsyncValue<List<Post>>> {
  PostUserController(this._user, this._postRepository)
      : super(const AsyncValue.loading()) {
    {
      _subscription?.cancel();
      _subscription =
          _postRepository.watchPostsOfUser(_user.id).listen((posts) {
        posts.fold((_) => null, (data) {
          data.sort((a, b) => a.createdDate.compareTo(b.createdDate));
          state = AsyncValue.data(data);
        });
      });
    }
  }

  final User _user;
  StreamSubscription<void>? _subscription;
  final PostRepository _postRepository;

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
