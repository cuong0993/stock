import 'package:domain/post/post.dart';
import 'package:domain/post/post_repository.dart';
import 'package:riverpod/riverpod.dart';

class DetailPostController extends StateNotifier<AsyncValue<Post>> {
  DetailPostController(this._postId, this._postRepository)
      : super(const AsyncValue.loading()) {
    _postRepository.watchPost(_postId).listen((post) async {
      post.fold((_) => null, (data) => state = AsyncValue.data(data));
    });
  }

  final String _postId;
  final PostRepository _postRepository;
}
