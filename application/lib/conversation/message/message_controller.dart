import 'dart:async';

import 'package:domain/conversation/message/message.dart';
import 'package:domain/conversation/message/message_repository.dart';
import 'package:riverpod/riverpod.dart';

class MessageController extends StateNotifier<AsyncValue<List<Message>>> {
  MessageController(this._conversationId, this._messageRepository)
      : super(const AsyncValue.loading()) {
    {
      _subscription?.cancel();
      _subscription = _messageRepository
          .watchMessagesOfConversation(_conversationId)
          .listen((messages) {
        messages.fold((_) => null, (messages) {
          messages.sort((a, b) => a.createdDate.compareTo(b.createdDate));
          state = AsyncValue.data(messages);
        });
      });
    }
  }

  final String _conversationId;
  final MessageRepository _messageRepository;
  StreamSubscription<void>? _subscription;

  Future<void> createMessage(Message message) async {
    await _messageRepository.createMessage(message);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
