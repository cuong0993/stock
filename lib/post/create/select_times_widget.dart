import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'time_of_day_extension.dart';

class SelectTimesWidget extends HookWidget {
  const SelectTimesWidget({
    required this.timeSlots,
    Key? key,
  }) : super(key: key);

  final List<DateTime> timeSlots;

  @override
  Widget build(BuildContext context) {
    final timeOfDays = <TimeOfDay>[];
    var timeOfDay = const TimeOfDay(hour: 0, minute: 0);
    while (timeOfDay.before(const TimeOfDay(hour: 24, minute: 0))) {
      timeOfDays.add(timeOfDay);
      timeOfDay = timeOfDay.add(minutes: 30);
    }
    final selectedDateTimes = useState(
      List<DateTime>.from(timeSlots),
    );

    return WillPopScope(
      onWillPop: () {
        selectedDateTimes.value.sort((a, b) => a.compareTo(b));
        Navigator.pop(
          context,
          selectedDateTimes.value,
        );

        return Future.value(false);
      },
      child: Column(
        children: [
          AppBar(title: const Text('Time')),
          Expanded(
            child: Scrollbar(
              isAlwaysShown: true,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: timeOfDays.length,
                itemBuilder: (context, index) => CheckboxListTile(
                  title: Text(
                    timeOfDays[index].format(context),
                  ),
                  value: selectedDateTimes.value
                      .map(
                        TimeOfDay.fromDateTime,
                      )
                      .contains(timeOfDays[index]),
                  onChanged: (isSelected) {
                    final newTimes = [
                      ...selectedDateTimes.value,
                    ];
                    if (isSelected!) {
                      final now = DateTime.now();
                      newTimes.add(
                        DateTime(
                          now.year,
                          now.month,
                          now.day,
                          timeOfDays[index].hour,
                          timeOfDays[index].minute,
                        ),
                      );
                    } else {
                      final now = DateTime.now();
                      newTimes.remove(
                        DateTime(
                          now.year,
                          now.month,
                          now.day,
                          timeOfDays[index].hour,
                          timeOfDays[index].minute,
                        ),
                      );
                    }
                    selectedDateTimes.value = newTimes;
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
