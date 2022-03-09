import 'package:auto_route/auto_route.dart';
import 'package:domain/meeting/meeting.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app/root_router.dart';

class MeetingWidget extends ConsumerWidget {
  const MeetingWidget({
    required this.meeting,
    Key? key,
  }) : super(key: key);
  final Meeting meeting;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: GestureDetector(
          onTap: () => AutoRouter.of(context)
              .push(VideoConfigRoute(meetingId: meeting.id)),
          child: Container(
            color: Theme.of(context).cardColor,
            child: Text(meeting.name),
          ),
        ),
      );
}
