import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  int compare(TimeOfDay other) => inMinutes() - other.inMinutes();

  int inMinutes() => hour * 60 + minute;

  bool before(TimeOfDay other) => compare(other) < 0;

  bool after(TimeOfDay other) => compare(other) > 0;

  TimeOfDay add({required int minutes}) {
    final total = inMinutes() + minutes;

    return TimeOfDay(hour: total ~/ 60, minute: total % 60);
  }

  TimeOfDay subtract({required int minutes}) {
    final total = inMinutes() - minutes;

    return TimeOfDay(hour: total ~/ 60, minute: total % 60);
  }
}
