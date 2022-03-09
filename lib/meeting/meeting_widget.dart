import 'package:domain/meeting/meeting.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MeetingWidget extends ConsumerWidget {
  const MeetingWidget({
    required this.meeting,
    Key? key,
  }) : super(key: key);
  final Meeting meeting;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Container(
          color: Theme.of(context).cardColor,
          child: Text(meeting.name),
        ),
      );
}
