import 'package:application/providers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain/conversation/message/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;

class MessagePage extends HookConsumerWidget {
  const MessagePage({
    required this.conversationId,
    required this.isGoingToMessage,
    required this.userIds,
    super.key,
  });
  final bool isGoingToMessage;
  final String? conversationId;
  final List<String> userIds;

  @override
  Widget build(BuildContext context, WidgetRef ref) => FutureBuilder<String>(
        future: () async {
          if (conversationId != null) {
            return conversationId!;
          }

          return ref
              .read(
                myConversationsProvider.notifier,
              )
              .createConversationWithUser(
                userIds,
              );
        }(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final conversationId = snapshot.requireData;

            return HookConsumer(
              builder: (context, ref, child) {
                final focusNode = useFocusNode();
                final textEditingController = useTextEditingController();
                final messageState = useState('');
                final messages =
                    ref.watch(messageOfConversationProvider(conversationId));

                return Scaffold(
                  appBar: AppBar(),
                  body: Scrollbar(
                    thumbVisibility: true,
                    child: messages.when(
                      data: (comments) => ListView.builder(
                        shrinkWrap: true,
                        itemCount: comments.length,
                        itemBuilder: (context, index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              leading: CircleAvatar(
                                radius: 20,
                                backgroundImage: CachedNetworkImageProvider(
                                  comments[index].userPhotoUrl,
                                ),
                              ),
                              title: Text(
                                comments[index].userName,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              subtitle: Text(
                                timeago.format(
                                  comments[index].createdDate,
                                ),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Text(
                                comments[index].text,
                              ),
                            ),
                            const Divider(),
                          ],
                        ),
                      ),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (_, __) =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                  bottomNavigationBar: BottomAppBar(
                    child: Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: textEditingController,
                              maxLines: null,
                              focusNode: focusNode,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Message',
                                hintStyle: TextStyle(fontSize: 18),
                              ),
                              onChanged: (text) {
                                messageState.value = text;
                              },
                            ),
                          ),
                          Consumer(
                            builder: (context, ref, child) {
                              final enabled = messageState.value.isNotEmpty;

                              return enabled
                                  ? IconButton(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      icon: const Icon(Icons.send_rounded),
                                      onPressed: () async {
                                        final user = ref
                                            .read(myUserProvider)
                                            .asData
                                            ?.value;
                                        if (user != null) {
                                          final message = Message(
                                            userName: user.name,
                                            userId: user.id,
                                            conversationId: conversationId,
                                            userPhotoUrl: user.photoUrl,
                                            text: messageState.value,
                                            createdDate: DateTime.now(),
                                            id: '',
                                          );
                                          await ref
                                              .read(
                                                messageOfConversationProvider(
                                                  conversationId,
                                                ).notifier,
                                              )
                                              .createMessage(message);
                                          focusNode.unfocus();
                                          textEditingController.clear();
                                        }
                                      },
                                    )
                                  : const IconButton(
                                      icon: Icon(Icons.send_rounded),
                                      onPressed: null,
                                    );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            // TODO .
            return const SizedBox();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      );
}
