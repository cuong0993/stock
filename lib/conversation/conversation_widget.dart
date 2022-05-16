import 'package:domain/conversation/conversation.dart';
import 'package:flutter/material.dart';

class ConversationWidget extends StatelessWidget {
  const ConversationWidget({
    required this.conversation,
    super.key,
  });
  final Conversation conversation;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: GestureDetector(
          child: ColoredBox(
            color: Theme.of(context).cardColor,
            child: Text('${conversation.participantIds}'),
          ),
        ),
      );
}
