import 'package:application/providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'meeting_widget.dart';

class MeetingsWidget extends ConsumerWidget {
  const MeetingsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meetings = ref.watch(myMeetingsProvider);

    return Scrollbar(
      child: meetings.when(
        data: (meetings) => ListView.builder(
          itemCount: meetings.length,
          itemBuilder: (context, index) {
            final meeting = meetings[index];

            return MeetingWidget(meeting: meeting);
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
