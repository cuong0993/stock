import 'dart:async';

import 'package:domain/post/comment/comment.dart';
import 'package:domain/post/comment/comment_repository.dart';
import 'package:domain/user/user.dart';
import 'package:riverpod/riverpod.dart';

class CommentUserController extends StateNotifier<AsyncValue<List<Comment>>> {
  CommentUserController(this._user, this._commentRepository)
      : super(const AsyncValue.loading()) {
    {
      _subscription?.cancel();
      _subscription =
          _commentRepository.watchCommentsOfUser(_user.id).listen((comments) {
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

  final User _user;
  final CommentRepository _commentRepository;
  StreamSubscription<void>? _subscription;

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
