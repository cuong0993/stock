import 'package:domain/post/tag/tag.dart';
import 'package:domain/post/tag/tag_repository.dart';
import 'package:riverpod/riverpod.dart';

class TagController extends StateNotifier<AsyncValue<List<Tag>>> {
  TagController(this._tagRepository) : super(const AsyncValue.loading()) {
    Future.microtask(() async {
      final tag = await _tagRepository.getTags();
      tag.fold(
        (_) {
          state = const AsyncValue.error('');
        },
        (tag) {
          state = AsyncValue.data(tag);
        },
      );
    });
  }

  final TagRepository _tagRepository;
}
