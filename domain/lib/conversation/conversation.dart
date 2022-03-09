import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation.freezed.dart';

@freezed
class Conversation with _$Conversation {
  factory Conversation({
    required List<String> participantIds,
    required Map<String, int> lastViews,
    required String id,
  }) = _Conversation;
}
