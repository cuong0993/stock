import 'package:domain/conversation/conversation.dart';
import 'package:domain/conversation/message/message.dart';
import 'package:domain/meeting/meeting.dart';
import 'package:domain/post/comment/comment.dart';
import 'package:domain/post/like/like.dart';
import 'package:domain/post/post.dart';
import 'package:domain/post/tag/tag.dart';
import 'package:domain/user/user.dart';
import 'package:domain/video/video_config.dart';
import 'package:domain/video/video_service.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod/riverpod.dart';

import 'app/app_controller.dart';
import 'app/app_state.dart';
import 'authentication/authenticated_user_controller.dart';
import 'authentication/authentication_controller.dart';
import 'authentication/authentication_state.dart';
import 'conversation/conversation_controller.dart';
import 'conversation/message/message_controller.dart';
import 'meeting/meeting_controller.dart';
import 'post/comment_post_controller.dart';
import 'post/create/create_post_controller.dart';
import 'post/create/create_post_state.dart';
import 'post/detail_post_controller.dart';
import 'post/like_post_controller.dart';
import 'post/post_controller.dart';
import 'post/tag_controller.dart';
import 'user/comment_user_controller.dart';
import 'user/edit/edit_user_controller.dart';
import 'user/edit/edit_user_state.dart';
import 'user/post_user_controller.dart';
import 'user/user_controller.dart';
import 'video/video_controller.dart';
import 'video/video_state.dart';

final appTagProvider =
    StateNotifierProvider<TagController, AsyncValue<List<Tag>>>(
  (ref) => TagController(GetIt.instance()),
);

final authenticationProvider =
    StateNotifierProvider<AuthenticationController, AuthenticationState>(
  (ref) => AuthenticationController(GetIt.instance()),
);

final myUserProvider =
    StateNotifierProvider<AuthenticatedUserController, AsyncValue<User>>((ref) {
  ref.watch(authenticationProvider);

  return AuthenticatedUserController(GetIt.instance(), GetIt.instance());
});

final myPostsProvider =
    StateNotifierProvider<PostController, AsyncValue<List<Post>>>(
  (ref) => PostController(GetIt.instance()),
);

final myMeetingsProvider =
    StateNotifierProvider<MeetingController, AsyncValue<List<Meeting>>>((ref) {
  final user = ref.watch(myUserProvider).when(
        data: (data) => data,
        loading: () => null,
        error: (_, __) => null,
      );

  return MeetingController(user, GetIt.instance());
});

final myConversationsProvider = StateNotifierProvider<ConversationController,
    AsyncValue<List<Conversation>>>((ref) {
  final user = ref.watch(myUserProvider).when(
        data: (data) => data,
        loading: () => null,
        error: (_, __) => null,
      );

  return ConversationController(user, GetIt.instance());
});

final createPostControllerProvider =
    StateNotifierProvider.autoDispose<CreatePostController, CreatePostState>(
  (ref) => CreatePostController(GetIt.instance()),
);

final likesOfPostProvider = StateNotifierProvider.autoDispose
    .family<LikePostController, AsyncValue<List<Like>>, Post>(
  (ref, post) => LikePostController(post, GetIt.instance()),
);

final detailOfPostProvider = StateNotifierProvider.autoDispose
    .family<DetailPostController, AsyncValue<Post>, String>(
  (ref, postId) => DetailPostController(postId, GetIt.instance()),
);

final commentsOfPostProvider = StateNotifierProvider.autoDispose
    .family<CommentPostController, AsyncValue<List<Comment>>, String>(
  (ref, postId) => CommentPostController(postId, GetIt.instance()),
);

final userOfIdProvider = StateNotifierProvider.autoDispose
    .family<UserController, AsyncValue<User>, String>(
  (ref, userId) => UserController(userId, GetIt.instance()),
);

final postsOfUserProvider = StateNotifierProvider.autoDispose
    .family<PostUserController, AsyncValue<List<Post>>, User>(
  (ref, user) => PostUserController(user, GetIt.instance()),
);

final commentsOfUserProvider = StateNotifierProvider.autoDispose
    .family<CommentUserController, AsyncValue<List<Comment>>, User>(
  (ref, user) => CommentUserController(user, GetIt.instance()),
);

final messageOfConversationProvider = StateNotifierProvider.autoDispose
    .family<MessageController, AsyncValue<List<Message>>, String>(
  (ref, conversationId) => MessageController(conversationId, GetIt.instance()),
);

final editUserControllerProvider = StateNotifierProvider.autoDispose
    .family<EditUserController, EditUserState, User>(
  (ref, user) => EditUserController(user),
);

final videoServiceProvider =
    FutureProvider<VideoService>((ref) async => GetIt.instance.getAsync());

final myVideoOfMeetingControllerProvider = StateNotifierProvider.autoDispose
    .family<VideoController, VideoState, VideoConfig>((ref, videoConfig) {
  final user = ref.watch(myUserProvider).when(
        data: (data) => data,
        loading: () => null,
        error: (_, __) => null,
      );
  final videoService = ref.watch(videoServiceProvider).when(
        data: (data) => data,
        loading: () => null,
        error: (_, __) => null,
      );

  return VideoController(videoConfig, user, videoService);
});

final appProvider = StateNotifierProvider.autoDispose<AppController, AppState>(
  (ref) => AppController(GetIt.instance()),
);
