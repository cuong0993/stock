import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:domain/conversation/conversation.dart' as domain;
import 'package:domain/conversation/message/message.dart' as domain;
import 'package:json_annotation/json_annotation.dart';

import '../firebase_date_time_converter.dart';

part 'conversation.g.dart';

@JsonSerializable()
class Conversation {
  const Conversation({
    required this.participantIds,
    required this.lastViews,
    required this.id,
    required this.participantCount,
  });

  factory Conversation.fromDomain(domain.Conversation conversation) =>
      Conversation(
        participantIds: {
          for (final item in conversation.participantIds) item: true,
        },
        lastViews: conversation.lastViews,
        id: conversation.id,
        participantCount: conversation.participantIds.length,
      );

  final Map<String, bool> participantIds;
  final Map<String, int> lastViews;
  final String id;
  final int participantCount;

  domain.Conversation toDomain() => domain.Conversation(
        participantIds: participantIds.keys.toList(),
        lastViews: lastViews,
        id: id,
      );
}

@Collection<Conversation>('conversations')
@Collection<Message>('conversations/*/messages')
final conversationsRef = ConversationCollectionReference();

@JsonSerializable()
class Message {
  const Message({
    required this.userName,
    required this.userId,
    required this.conversationId,
    required this.userPhotoUrl,
    required this.text,
    required this.createdDate,
    required this.id,
  });

  factory Message.fromDomain(domain.Message message) => Message(
        userName: message.userName,
        userId: message.userId,
        conversationId: message.conversationId,
        userPhotoUrl: message.userPhotoUrl,
        text: message.text,
        createdDate: message.createdDate,
        id: message.id,
      );
  final String userName;
  final String userId;
  final String conversationId;
  final String userPhotoUrl;
  final String text;
  @FirebaseDateTimeConverter()
  final DateTime createdDate;
  final String id;

  domain.Message toDomain() => domain.Message(
        userName: userName,
        userId: userId,
        conversationId: conversationId,
        userPhotoUrl: userPhotoUrl,
        text: text,
        createdDate: createdDate,
        id: id,
      );
}
