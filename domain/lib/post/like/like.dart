import 'package:freezed_annotation/freezed_annotation.dart';

part 'like.freezed.dart';

@freezed
class Like with _$Like {
  factory Like({
    required String userName,
    required String userId,
    required String postId,
    required String userPhotoUrl,
    required DateTime createdDate,
    required String id,
  }) = _Like;
}
