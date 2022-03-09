import 'package:domain/user/user.dart';
import 'package:domain/video/video_config.dart';
import 'package:domain/video/video_service.dart';
import 'package:riverpod/riverpod.dart';

import 'video_state.dart';

class VideoController extends StateNotifier<VideoState> {
  VideoController(VideoConfig videoConfig, this._user, this._videoService)
      : super(
          VideoState(
            users: [],
            infoStrings: [],
            isVideoEnabled: videoConfig.isVideoEnabled,
            isAudioEnabled: videoConfig.isAudioEnabled,
          ),
        ) {
    final user = _user;
    final videoService = _videoService;
    if (user != null && videoService != null) {
      Future.microtask(() async {
        videoService.setEventHandler(
          error: (error) {
            final info = 'onError: $error';
            final infoStrings = state.infoStrings..add(info);
            state = state.copyWith(infoStrings: infoStrings);
          },
          joinChannelSuccess: (channel, uid, elapsed) {
            final info = 'onJoinChannel: $channel, uid: $uid';
            final infoStrings = state.infoStrings..add(info);
            state = state.copyWith(infoStrings: infoStrings);
          },
          userJoined: (uid, elapsed) {
            final info = 'userJoined: $uid';
            final infoStrings = state.infoStrings..add(info);
            final users = state.users..add(uid);
            state = state.copyWith(infoStrings: infoStrings, users: users);
          },
          userOffline: (uid, reason) {
            final info = 'userOffline: $uid';
            final infoStrings = state.infoStrings..add(info);
            final users = state.users..remove(uid);
            state = state.copyWith(infoStrings: infoStrings, users: users);
          },
          firstRemoteVideoFrame: (uid, width, height, elapsed) {
            final info = 'firstRemoteVideo: $uid ${width}x $height';
            final infoStrings = state.infoStrings..add(info);
            state = state.copyWith(infoStrings: infoStrings);
          },
        );
        await videoService.joinChannel(
          channelName: videoConfig.meetingId,
          userAccount: user.id,
        );
      });
    }
  }

  final VideoService? _videoService;
  final User? _user;

  Future<void> leaveCurrentChannel() => _videoService!.leaveCurrentChannel();

  void onToggleVideo() {
    state = state.copyWith(isVideoEnabled: !state.isVideoEnabled);
    _videoService!.toggleVideo(isEnabled: state.isVideoEnabled);
  }

  void onToggleAudio() {
    state = state.copyWith(isAudioEnabled: !state.isAudioEnabled);
    _videoService!.toggleAudio(isEnabled: state.isAudioEnabled);
  }

  void onSwitchCamera() {
    _videoService!.switchCamera();
  }
}
