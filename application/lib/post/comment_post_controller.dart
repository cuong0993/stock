import 'dart:async';

import 'package:domain/post/comment/comment.dart';
import 'package:domain/post/comment/comment_repository.dart';
import 'package:riverpod/riverpod.dart';

class CommentPostController extends StateNotifier<AsyncValue<List<Comment>>> {
  CommentPostController(this._postId, this._commentRepository)
      : super(const AsyncValue.loading()) {
    {
      _subscription?.cancel();
      _subscription =
          _commentRepository.watchCommentsOfPost(_postId).listen((comments) {
        comments.fold(
          (_) {
            state = const AsyncValue.data([]);
          },
          (comments) {
            comments.sort((a, b) => a.createdDate.compareTo(b.createdDate));
            state = AsyncValue.data(comments);
          },
        );
      });
    }
  }

  final String _postId;
  final CommentRepository _commentRepository;
  StreamSubscription<void>? _subscription;

  Future<void> createComment(Comment comment) async {
    await _commentRepository.createComment(comment);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
