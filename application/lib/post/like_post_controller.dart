import 'dart:async';

import 'package:domain/post/like/like.dart';
import 'package:domain/post/like/like_repository.dart';
import 'package:domain/post/post.dart';
import 'package:riverpod/riverpod.dart';

class LikePostController extends StateNotifier<AsyncValue<List<Like>>> {
  LikePostController(this._post, this._likeRepository)
      : super(const AsyncValue.loading()) {
    {
      _subscription?.cancel();
      _subscription =
          _likeRepository.watchLikesOfPost(_post.id).listen((likes) {
        likes.fold(
          (_) {
            state = const AsyncValue.data([]);
          },
          (likes) {
            likes.sort((a, b) => a.createdDate.compareTo(b.createdDate));
            state = AsyncValue.data(likes);
          },
        );
      });
    }
  }

  final Post _post;
  final LikeRepository _likeRepository;
  StreamSubscription<void>? _subscription;

  Future<void> createLike(Like like) async {
    await _likeRepository.createLike(like);
  }

  Future<void> removeLike(Like like) async {
    await _likeRepository.removeLike(like);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
