import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_config.freezed.dart';

@freezed
class VideoConfig with _$VideoConfig {
  factory VideoConfig({
    required String meetingId,
    required bool isVideoEnabled,
    required bool isAudioEnabled,
  }) = _VideoConfig;
}
