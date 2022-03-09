import 'dart:async';

import 'package:domain/post/post.dart';
import 'package:domain/post/post_repository.dart';
import 'package:riverpod/riverpod.dart';

class PostController extends StateNotifier<AsyncValue<List<Post>>> {
  PostController(this._postRepository) : super(const AsyncValue.loading()) {
    {
      _subscription?.cancel();
      _subscription = _postRepository.watchPosts().listen((result) {
        state = result.fold(
          (_) => const AsyncValue.data([]),
          (data) {
            data.sort((a, b) => a.createdDate.compareTo(b.createdDate));

            return AsyncValue.data(data);
          },
        );
      });
    }
  }

  StreamSubscription<void>? _subscription;
  final PostRepository _postRepository;

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
