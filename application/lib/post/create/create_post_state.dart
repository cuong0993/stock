import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_post_state.freezed.dart';

@freezed
class CreatePostState with _$CreatePostState {
  factory CreatePostState({
    required List<String> imageUrls,
    required List<String> tags,
    required String text,
    required String name,
    required List<DateTime> timeSlots,
  }) = _CreatePostState;
}
