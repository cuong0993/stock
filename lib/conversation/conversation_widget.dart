import 'package:auto_route/auto_route.dart';
import 'package:domain/conversation/conversation.dart';
import 'package:flutter/material.dart';

import '../app/root_router.dart';

class ConversationWidget extends StatelessWidget {
  const ConversationWidget({
    required this.conversation,
    Key? key,
  }) : super(key: key);
  final Conversation conversation;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: GestureDetector(
          onTap: () => AutoRouter.of(context).push(
            MessageRoute(
              isGoingToMessage: false,
              conversationId: conversation.id,
              userIds: const [],
            ),
          ),
          child: Container(
            color: Theme.of(context).cardColor,
            child: Text('${conversation.participantIds}'),
          ),
        ),
      );
}
