import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';

@freezed
class Comment with _$Comment {
  factory Comment({
    required String userName,
    required String userId,
    required String postId,
    required String userPhotoUrl,
    required String text,
    required DateTime createdDate,
    required String id,
  }) = _Comment;
}
