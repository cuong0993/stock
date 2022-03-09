import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';

@freezed
class Post with _$Post {
  factory Post({
    required String userName,
    required String userId,
    required String userPhotoUrl,
    required String text,
    required String name,
    required int commentCount,
    required List<String> likedUserIds,
    required List<String> tags,
    required DateTime createdDate,
    required List<DateTime> timeSlots,
    required List<String> images,
    required String id,
  }) = _Post;
}
