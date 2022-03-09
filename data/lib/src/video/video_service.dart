import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/failure.dart';
import 'package:domain/video/video_service.dart' as domain;
import 'package:injectable/injectable.dart';

import 'agora_token_api_client.dart';
import 'agora_token_request.dart';

@LazySingleton(as: domain.VideoService)
class VideoService extends domain.VideoService {
  VideoService(this._apiClient, this._rtcEngine);

  final RtcEngine _rtcEngine;
  final AgoraTokenApiClient _apiClient;

  @override
  Future<void> leaveCurrentChannel() => _rtcEngine.leaveChannel();

  @override
  Future<void> toggleAudio({required bool isEnabled}) =>
      _rtcEngine.enableLocalAudio(isEnabled);

  @override
  Future<void> switchCamera() => _rtcEngine.switchCamera();

  @override
  Future<Either<Failure, Unit>> joinChannel({
    required String channelName,
    required String userAccount,
  }) async {
    try {
      final token = await _apiClient.getAgoraToken(
        AgoraTokenRequest(channelName: channelName, account: userAccount),
      );

      await _rtcEngine.joinChannelWithUserAccount(
        token,
        channelName,
        userAccount,
      );

      return right(unit);
    } on Exception catch (_) {
      return left(const Failure.serverError());
    }
  }

  @override
  // ignore: long-parameter-list
  void setEventHandler({
    void Function(String code)? error,
    void Function(String channel, int uid, int elapsed)? joinChannelSuccess,
    void Function(String stats)? leaveChannel,
    void Function(int uid, int elapsed)? userJoined,
    void Function(int uid, String reason)? userOffline,
    void Function(int uid, int width, int height, int elapsed)?
        firstRemoteVideoFrame,
    void Function(int uid, int width, int height, int rotation)?
        videoSizeChanged,
    void Function(int width, int height, int elapsed)? firstLocalVideoFrame,
    void Function(String localVideoState, String error)? localVideoStateChanged,
  }) =>
      _rtcEngine.setEventHandler(
        RtcEngineEventHandler(
          error: (code) {
            error?.call(code.toString());
          },
          joinChannelSuccess: joinChannelSuccess,
          leaveChannel: (stats) {
            leaveChannel?.call(stats.toString());
          },
          userJoined: userJoined,
          userOffline: (uid, reason) {
            userOffline?.call(uid, reason.toString());
          },
          firstRemoteVideoFrame: firstRemoteVideoFrame,
          videoSizeChanged: videoSizeChanged,
          firstLocalVideoFrame: firstLocalVideoFrame,
          localVideoStateChanged: (localVideoState, error) {
            localVideoStateChanged?.call(localVideoState.name, error.name);
          },
        ),
      );

  @override
  Future<void> toggleVideo({required bool isEnabled}) =>
      _rtcEngine.enableLocalVideo(isEnabled);

  @override
  Future<void> startPreview() async {
    await _rtcEngine.startPreview();
  }

  @override
  Future<void> stopPreview() async {
    await _rtcEngine.stopPreview();
  }
}
