import 'package:dartz/dartz.dart';

import '../failure.dart';
import 'conversation.dart';

abstract class ConversationRepository {
  Stream<Either<Failure, List<Conversation>>> watchConversationsOfUser(
    String userId,
  );

  Future<Option<Conversation>> getConversationOfUsers(List<String> userIds);

  Future<Either<Failure, Conversation>> createConversation(
    Conversation conversation,
  );
}
