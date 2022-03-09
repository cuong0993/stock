import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/failure.dart';
import 'package:domain/meeting/meeting.dart' as domain;
import 'package:domain/meeting/meeting_repository.dart' as domain;
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import 'meeting.dart';

@LazySingleton(as: domain.MeetingRepository)
class MeetingRepository extends domain.MeetingRepository {
  @override
  Stream<Either<Failure, List<domain.Meeting>>> watchMeetingsOfUser(
    String userId,
  ) =>
      meetingsRef.reference
          .where('participantIds.$userId', isEqualTo: true)
          .withConverter(
            fromFirestore: MeetingCollectionReference.fromFirestore,
            toFirestore: MeetingCollectionReference.toFirestore,
          )
          .snapshots()
          .map(
            (querySnapshot) => right<Failure, List<domain.Meeting>>(
              querySnapshot.docs
                  .map(
                    (doc) => doc.data().toDomain(),
                  )
                  .toList(),
            ),
          )
          .onErrorReturnWith((_, __) => left(const Failure.serverError()));

  @override
  Future<Either<Failure, domain.Meeting>> createMeeting(
    domain.Meeting meeting,
  ) async {
    try {
      final doc = meetingsRef.doc();
      await doc.set(Meeting.fromDomain(meeting.copyWith(id: doc.id)));

      return right(meeting);
    } on FirebaseException catch (_) {
      return left(const Failure.serverError());
    }
  }
}
