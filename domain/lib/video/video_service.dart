import 'package:dartz/dartz.dart';

import '../failure.dart';

abstract class VideoService {
  Future<void> startPreview();

  Future<void> stopPreview();

  Future<void> switchCamera();

  Future<void> toggleVideo({required bool isEnabled});

  Future<void> toggleAudio({required bool isEnabled});

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
  });

  Future<Either<Failure, Unit>> joinChannel({
    required String channelName,
    required String userAccount,
  });

  Future<void> leaveCurrentChannel();
}
