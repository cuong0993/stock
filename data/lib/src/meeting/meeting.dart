import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:domain/meeting/meeting.dart' as domain;
import 'package:json_annotation/json_annotation.dart';

import '../firebase_timestamp_converter.dart';

part 'meeting.g.dart';

@JsonSerializable()
class Meeting {
  const Meeting({
    required this.participantIds,
    required this.participantNames,
    required this.participantUrls,
    required this.id,
    required this.name,
    required this.time,
    required this.createdUserId,
    required this.participantCount,
  });

  factory Meeting.fromDomain(domain.Meeting meeting) => Meeting(
        participantIds: meeting.participantIds,
        participantNames: meeting.participantNames,
        participantUrls: meeting.participantUrls,
        id: meeting.id,
        name: meeting.name,
        time: meeting.time,
        createdUserId: meeting.createdUserId,
        participantCount: meeting.participantCount,
      );

  final Map<String, bool> participantIds;
  final Map<String, String> participantNames;
  final Map<String, String> participantUrls;
  final String id;
  final String name;
  @FirebaseTimestampConverter()
  final DateTime time;
  final String createdUserId;
  final int participantCount;

  domain.Meeting toDomain() => domain.Meeting(
        participantIds: participantIds,
        participantNames: participantNames,
        participantUrls: participantUrls,
        id: id,
        name: name,
        time: time,
        createdUserId: createdUserId,
        participantCount: participantCount,
      );
}

@Collection<Meeting>('meetings')
final meetingsRef = MeetingCollectionReference();
