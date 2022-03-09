import 'dart:async';

import 'package:domain/conversation/conversation.dart';
import 'package:domain/conversation/conversation_repository.dart';
import 'package:domain/user/user.dart';
import 'package:riverpod/riverpod.dart';

class ConversationController
    extends StateNotifier<AsyncValue<List<Conversation>>> {
  ConversationController(this._user, this._conversationRepository)
      : super(const AsyncValue.loading()) {
    {
      final user = _user;
      if (user != null) {
        _subscription?.cancel();
        _subscription = _conversationRepository
            .watchConversationsOfUser(user.id)
            .listen((conversations) {
          conversations.fold((_) => null, (conversations) {
            state = AsyncValue.data(conversations);
          });
        });
      }
    }
  }

  StreamSubscription<void>? _subscription;
  final ConversationRepository _conversationRepository;
  final User? _user;

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  Future<String> createConversationWithUser(List<String> userIds) async {
    final user = _user;
    if (user != null) {
      return (await _conversationRepository.getConversationOfUsers([
        ...userIds,
        user.id,
      ]))
          .fold(
        () async => (await _conversationRepository.createConversation(
          Conversation(
            participantIds: [...userIds, user.id],
            lastViews: {
              for (var item in [...userIds, user.id])
                item: DateTime.now().millisecondsSinceEpoch,
            },
            id: '',
          ),
        ))
            .fold(
          (_) {
            throw Exception();
          },
          (conversation) => conversation.id,
        ),
        (conversation) => conversation.id,
      );
    }
    throw Exception();
  }
}
