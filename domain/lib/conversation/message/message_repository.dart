import 'package:dartz/dartz.dart';

import '../../failure.dart';
import 'message.dart';

abstract class MessageRepository {
  Stream<Either<Failure, List<Message>>> watchMessagesOfConversation(
    String conversationId,
  );

  Future<Either<Failure, Unit>> createMessage(Message message);
}
