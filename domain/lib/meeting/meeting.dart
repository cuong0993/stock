import 'package:freezed_annotation/freezed_annotation.dart';

part 'meeting.freezed.dart';

@freezed
class Meeting with _$Meeting {
  factory Meeting({
    required Map<String, bool> participantIds,
    required Map<String, String> participantNames,
    required Map<String, String> participantUrls,
    required String id,
    required String name,
    required DateTime time,
    required String createdUserId,
    required int participantCount,
  }) = _Meeting;
}
