import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_state.freezed.dart';

@freezed
class VideoState with _$VideoState {
  factory VideoState({
    required List<int> users,
    required List<String> infoStrings,
    required bool isVideoEnabled,
    required bool isAudioEnabled,
  }) = _VideoState;
}
