import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';

@freezed
class Message with _$Message {
  factory Message({
    required String userName,
    required String userId,
    required String conversationId,
    required String userPhotoUrl,
    required String text,
    required DateTime createdDate,
    required String id,
  }) = _Message;
}
