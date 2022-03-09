import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/conversation/conversation.dart' as domain;
import 'package:domain/conversation/conversation_repository.dart' as domain;
import 'package:domain/failure.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import 'conversation.dart';

@LazySingleton(as: domain.ConversationRepository)
class ConversationRepository extends domain.ConversationRepository {
  @override
  Stream<Either<Failure, List<domain.Conversation>>> watchConversationsOfUser(
    String userId,
  ) =>
      conversationsRef.reference
          .where('participantIds.$userId', isEqualTo: true)
          .withConverter(
            fromFirestore: ConversationCollectionReference.fromFirestore,
            toFirestore: ConversationCollectionReference.toFirestore,
          )
          .snapshots()
          .map(
            (querySnapshot) => right<Failure, List<domain.Conversation>>(
              querySnapshot.docs
                  .map(
                    (doc) => doc.data().toDomain(),
                  )
                  .toList(),
            ),
          )
          .onErrorReturnWith((_, __) => left(const Failure.serverError()));

  @override
  Future<Option<domain.Conversation>> getConversationOfUsers(
    List<String> userIds,
  ) async {
    var query = conversationsRef
        .whereParticipantCount(isEqualTo: userIds.length)
        .reference;
    for (final userId in userIds) {
      query = query.where('participantIds.$userId', isEqualTo: true);
    }
    final snapshot = await query
        .withConverter(
          fromFirestore: ConversationCollectionReference.fromFirestore,
          toFirestore: ConversationCollectionReference.toFirestore,
        )
        .get();

    return snapshot.docs.isEmpty
        ? optionOf(null)
        : optionOf(snapshot.docs.first.data().toDomain());
  }

  @override
  Future<Either<Failure, domain.Conversation>> createConversation(
    domain.Conversation conversation,
  ) async {
    try {
      final doc = conversationsRef.doc();
      final newConversation =
          Conversation.fromDomain(conversation.copyWith(id: doc.id));
      await doc.set(newConversation);

      return right(newConversation.toDomain());
    } on FirebaseException catch (_) {
      return left(const Failure.serverError());
    }
  }
}
