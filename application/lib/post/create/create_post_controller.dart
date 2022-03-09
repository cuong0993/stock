import 'package:domain/post/post.dart';
import 'package:domain/post/post_repository.dart';
import 'package:riverpod/riverpod.dart';

import 'create_post_state.dart';

class CreatePostController extends StateNotifier<CreatePostState> {
  CreatePostController(this._postRepository)
      : super(
          CreatePostState(
            imageUrls: [],
            tags: [],
            name: '',
            text: '',
            timeSlots: [],
          ),
        );
  final PostRepository _postRepository;

  void addImage(String path) {
    final imageUrls = state.imageUrls..add(path);
    state = state.copyWith(imageUrls: imageUrls);
  }

  void removeImage(int index) {
    final imageUrls = state.imageUrls..removeAt(index);
    state = state.copyWith(imageUrls: imageUrls);
  }

  void addTag(String tag) {
    state = state.copyWith(tags: [...state.tags..add(tag)]);
  }

  void removeTag(String tag) {
    state = state.copyWith(tags: [...state.tags..remove(tag)]);
  }

  Future<void> createPost(Post post) async {
    await _postRepository.createPost(post);
  }

  void write(String text) {
    state = state.copyWith(text: text);
  }

  void selectTimeSlots(List<DateTime> timeSlots) {
    state = state.copyWith(timeSlots: timeSlots);
  }

  void name(String name) {
    state = state.copyWith(name: name);
  }
}
