import 'dart:async';

import 'package:agora_rtc_engine/rtc_local_view.dart' as rtc_local_view;
import 'package:application/providers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:domain/video/video_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import '../app/root_router.dart';

final videoPreviewProvider = StreamProvider.autoDispose<String>((ref) async* {
  final controller = StreamController<String>();

  await [Permission.microphone, Permission.camera].request();
  final videoService = await ref.read(videoServiceProvider.future);
  videoService.setEventHandler(
    localVideoStateChanged: (localVideoState, error) {
      controller.add(localVideoState);
    },
  );
  await videoService.startPreview();

  ref.onDispose(() async {
    final videoService = await ref.read(videoServiceProvider.future);
    await videoService.stopPreview();
    await controller.close();
  });

  yield* controller.stream;
});

class VideoConfigPage extends HookConsumerWidget {
  const VideoConfigPage({
    required this.meetingId,
    Key? key,
  }) : super(key: key);
  final String meetingId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isVideoEnabled = useState(true);
    final isAudioEnabled = useState(true);
    final videoPreview = ref.watch(videoPreviewProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: videoPreview.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => Text('Error: $err'),
                data: (message) => isVideoEnabled.value
                    ? rtc_local_view.SurfaceView()
                    : const SizedBox(),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      AutoRouter.of(context).replace(
                        VideoRoute(
                          videoConfig: VideoConfig(
                            meetingId: meetingId,
                            isAudioEnabled: isAudioEnabled.value,
                            isVideoEnabled: isVideoEnabled.value,
                          ),
                        ),
                      );
                    },
                    child: const Text('Join'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final videoService =
                          await ref.read(videoServiceProvider.future);
                      await videoService.switchCamera();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(12),
                      primary: Colors.white,
                    ),
                    child: const Icon(
                      Icons.switch_camera,
                      color: Colors.blueAccent,
                      size: 20,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      isVideoEnabled.value = !isVideoEnabled.value;
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(12),
                      primary: Colors.white,
                    ),
                    child: Icon(
                      isVideoEnabled.value
                          ? Icons.videocam_rounded
                          : Icons.videocam_off_rounded,
                      color: Colors.blueAccent,
                      size: 20,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      isAudioEnabled.value = !isAudioEnabled.value;
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(12),
                      primary: Colors.white,
                    ),
                    child: Icon(
                      isAudioEnabled.value ? Icons.mic : Icons.mic_off,
                      color: Colors.blueAccent,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
