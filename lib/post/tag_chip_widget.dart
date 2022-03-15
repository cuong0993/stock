import 'package:flutter/material.dart';

class TagChipWidget extends StatelessWidget {
  const TagChipWidget({
    required this.text,
    Key? key,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).chipTheme.backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            text,
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      );
}