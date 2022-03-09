import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/conversation/message/message.dart' as domain;
import 'package:domain/conversation/message/message_repository.dart' as domain;
import 'package:domain/failure.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../conversation.dart';

@LazySingleton(as: domain.MessageRepository)
class MessageRepository extends domain.MessageRepository {
  @override
  Stream<Either<Failure, List<domain.Message>>> watchMessagesOfConversation(
    String conversationId,
  ) =>
      conversationsRef
          .doc(conversationId)
          .messages
          .snapshots()
          .map(
            (querySnapshot) => right<Failure, List<domain.Message>>(
              querySnapshot.docs.map((doc) => doc.data.toDomain()).toList(),
            ),
          )
          .onErrorReturnWith((_, __) => left(const Failure.serverError()));

  @override
  Future<Either<Failure, Unit>> createMessage(domain.Message message) async {
    try {
      final doc = conversationsRef.doc(message.conversationId).messages.doc();
      await doc.set(Message.fromDomain(message.copyWith(id: doc.id)));

      return right(unit);
    } on FirebaseException catch (_) {
      return left(const Failure.serverError());
    }
  }
}
