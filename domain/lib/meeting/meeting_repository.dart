import 'package:dartz/dartz.dart';

import '../failure.dart';
import 'meeting.dart';

abstract class MeetingRepository {
  Stream<Either<Failure, List<Meeting>>> watchMeetingsOfUser(String userId);

  Future<Either<Failure, Meeting>> createMeeting(Meeting meeting);
}
