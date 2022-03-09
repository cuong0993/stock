import 'dart:async';

import 'package:domain/meeting/meeting.dart';
import 'package:domain/meeting/meeting_repository.dart';
import 'package:domain/post/post.dart';
import 'package:domain/user/user.dart';
import 'package:riverpod/riverpod.dart';

class MeetingController extends StateNotifier<AsyncValue<List<Meeting>>> {
  MeetingController(this._user, this._meetingRepository)
      : super(const AsyncValue.loading()) {
    {
      final user = _user;
      if (user != null) {
        _subscription?.cancel();
        _subscription =
            _meetingRepository.watchMeetingsOfUser(user.id).listen((meetings) {
          meetings.fold((_) => null, (meetings) {
            state = AsyncValue.data(meetings);
          });
        });
      }
    }
  }

  StreamSubscription<void>? _subscription;
  final MeetingRepository _meetingRepository;
  final User? _user;

  Future<void> createMeeting(Post post, DateTime time) async {
    final user = _user;
    if (user != null) {
      await _meetingRepository.createMeeting(
        Meeting(
          participantIds: {user.id: true, post.userId: true},
          participantNames: {user.id: user.name, post.userId: post.userName},
          participantUrls: {
            user.id: user.photoUrl,
            post.userId: post.userPhotoUrl,
          },
          createdUserId: user.id,
          id: '',
          name: post.name,
          time: time,
          participantCount: 2,
        ),
      );
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
