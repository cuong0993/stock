import 'package:application/providers.dart';
import 'package:domain/post/post.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ScheduleMeetingWidget extends HookWidget {
  const ScheduleMeetingWidget({
    required this.post,
    Key? key,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    final selectedTime = useState<DateTime?>(null);

    return Column(
      children: [
        AppBar(
          title: Text(L10n.of(context)!.schedule),
          actions: [
            Consumer(
              builder: (context, ref, child) => IconButton(
                icon: const Icon(Icons.calendar_today_rounded),
                onPressed: (selectedTime.value != null)
                    ? () async {
                        await ref
                            .read(
                              myMeetingsProvider.notifier,
                            )
                            .createMeeting(
                              post,
                              selectedTime.value!,
                            );
                      }
                    : null,
              ),
            ),
          ],
        ),
        Expanded(
          child: Scrollbar(
            isAlwaysShown: true,
            child: ListView.builder(
              itemCount: post.timeSlots.length,
              itemBuilder: (context, index) => RadioListTile<DateTime>(
                title: Text(
                  TimeOfDay.fromDateTime(
                    post.timeSlots[index],
                  ).format(context),
                ),
                value: post.timeSlots[index],
                groupValue: selectedTime.value,
                onChanged: (value) {
                  selectedTime.value = value;
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
