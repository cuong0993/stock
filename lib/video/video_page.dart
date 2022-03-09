import 'package:agora_rtc_engine/rtc_local_view.dart' as rtc_local_view;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as rtc_remote_view;
import 'package:application/providers.dart';
import 'package:application/video/video_state.dart';
import 'package:domain/video/video_config.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VideoPage extends ConsumerWidget {
  const VideoPage({
    required this.videoConfig,
    Key? key,
  }) : super(key: key);
  final VideoConfig videoConfig;

  List<Widget> _getRenderViews(VideoState videoState) {
    final list = <Widget>[];
    if (videoState.isVideoEnabled) {
      list.add(rtc_local_view.SurfaceView());
    }
    for (final uid in videoState.users) {
      list.add(
        rtc_remote_view.SurfaceView(
          channelId: videoConfig.meetingId,
          uid: uid,
        ),
      );
    }

    return list;
  }

  Widget _videoView(Widget view) => Expanded(child: Container(child: view));

  Widget _expandedVideoRow(List<Widget> views) {
    final wrappedViews = views.map<Widget>(_videoView).toList();

    return Expanded(
      child: Row(
        children: wrappedViews,
      ),
    );
  }

  Widget _viewRows(VideoState videoState) {
    final views = _getRenderViews(videoState);
    switch (views.length) {
      case 1:
        return Column(
          children: <Widget>[_videoView(views[0])],
        );
      case 2:
        return Column(
          children: <Widget>[
            _expandedVideoRow([views[0]]),
            _expandedVideoRow([views[1]]),
          ],
        );
      case 3:
        return Column(
          children: <Widget>[
            _expandedVideoRow(views.sublist(0, 2)),
            _expandedVideoRow(views.sublist(2, 3)),
          ],
        );
      case 4:
        return Column(
          children: <Widget>[
            _expandedVideoRow(views.sublist(0, 2)),
            _expandedVideoRow(views.sublist(2, 4)),
          ],
        );
      default:
    }

    return const SizedBox.shrink();
  }

  Widget _toolbar(BuildContext context, VideoState videoState, WidgetRef ref) =>
      Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.symmetric(vertical: 48),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: ref
                  .read(
                    myVideoOfMeetingControllerProvider(videoConfig).notifier,
                  )
                  .onToggleAudio,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(12),
                primary: videoState.isAudioEnabled
                    ? Colors.blueAccent
                    : Colors.white,
              ),
              child: Icon(
                videoState.isAudioEnabled ? Icons.mic : Icons.mic_off,
                color: videoState.isAudioEnabled
                    ? Colors.white
                    : Colors.blueAccent,
                size: 20,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(
                      myVideoOfMeetingControllerProvider(videoConfig).notifier,
                    )
                    .leaveCurrentChannel();
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(15),
              ),
              child: const Icon(
                Icons.call_end,
              ),
            ),
            ElevatedButton(
              onPressed: ref
                  .read(
                    myVideoOfMeetingControllerProvider(videoConfig).notifier,
                  )
                  .onSwitchCamera,
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
          ],
        ),
      );

  Widget _panel(VideoState videoState) => Container(
        padding: const EdgeInsets.symmetric(vertical: 48),
        alignment: Alignment.bottomCenter,
        child: FractionallySizedBox(
          heightFactor: 0.5,
          child: ListView.builder(
            reverse: true,
            itemCount: videoState.infoStrings.length,
            itemBuilder: (context, index) {
              if (videoState.infoStrings.isEmpty) {
                return const SizedBox.shrink();
              }

              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.yellowAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        videoState.infoStrings[index],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoState =
        ref.watch(myVideoOfMeetingControllerProvider(videoConfig));

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: <Widget>[
            _viewRows(videoState),
            _panel(videoState),
            _toolbar(context, videoState, ref),
          ],
        ),
      ),
    );
  }
}
