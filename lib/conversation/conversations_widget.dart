import 'package:application/providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'conversation_widget.dart';

class ConversationsWidget extends ConsumerWidget {
  const ConversationsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final conversations = ref.watch(myConversationsProvider);

    return Scrollbar(
      child: conversations.when(
        data: (conversations) => ListView.builder(
          itemCount: conversations.length,
          itemBuilder: (context, index) {
            final conversation = conversations[index];

            return ConversationWidget(conversation: conversation);
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
