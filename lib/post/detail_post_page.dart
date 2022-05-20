import 'package:animations/animations.dart';
import 'package:application/providers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain/post/comment/comment.dart';
import 'package:domain/post/like/like.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'custom_image.dart';
import 'schedule_meeting_widget.dart';
import 'tag_chip_widget.dart';
import 'view_image.dart';

class DetailPostPage extends HookConsumerWidget {
  const DetailPostPage({
    required this.postId,
    required this.isGoingToComment,
    super.key,
  });
  final String postId;
  final bool isGoingToComment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNode = useFocusNode();
    final textEditingController = useTextEditingController();
    final commentState = useState('');
    final comments = ref.watch(commentsOfPostProvider(postId));
    final post = ref.watch(detailOfPostProvider(postId));
    useEffect(
      () {
        if (isGoingToComment) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            focusNode.requestFocus();
          });
        }

        return null;
      },
      [post],
    );

    return post.when(
      data: (post) => Scaffold(
        appBar: AppBar(
          title: GestureDetector(
            child: Row(
              children: [
                if (post.userPhotoUrl.isNotEmpty)
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: const Color(0xff4D4D4D),
                    backgroundImage:
                        CachedNetworkImageProvider(post.userPhotoUrl),
                  )
                else
                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xff4D4D4D),
                  ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      post.userName,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      timeago.format(post.createdDate),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Scrollbar(
          thumbVisibility: true,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    post.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    post.text,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: post.images.length,
                  itemBuilder: (context, index) => OpenContainer(
                    openBuilder: (context, _) =>
                        ViewImage(post: post, index: index),
                    closedShape: const RoundedRectangleBorder(),
                    closedBuilder: (context, openContainer) => CustomImage(
                      imageUrl: post.images[index],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Wrap(
                    spacing: 4,
                    runSpacing: 2,
                    children: post.tags
                        .map(
                          (e) => TagChipWidget(
                            text: e,
                          ),
                        )
                        .toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Consumer(
                            builder: (context, ref, child) {
                              final myUserId = ref.watch(myUserProvider).when(
                                    data: (data) => data.id,
                                    loading: () => null,
                                    error: (_, __) => null,
                                  );
                              final liked = !(myUserId == null) &&
                                  post.likedUserIds.contains(myUserId);

                              return IconButton(
                                icon: Icon(
                                  Icons.arrow_upward,
                                  color: liked
                                      ? Theme.of(context).colorScheme.secondary
                                      : null,
                                ),
                                onPressed: () async {
                                  final user =
                                      ref.read(myUserProvider).asData?.value;
                                  if (user != null) {
                                    final like = Like(
                                      userName: user.name,
                                      userId: user.id,
                                      postId: post.id,
                                      userPhotoUrl: user.photoUrl,
                                      createdDate: DateTime.now(),
                                      id: '',
                                    );
                                    if (!liked) {
                                      await ref
                                          .read(
                                            likesOfPostProvider(post).notifier,
                                          )
                                          .createLike(like);
                                    } else {
                                      await ref
                                          .read(
                                            likesOfPostProvider(post).notifier,
                                          )
                                          .removeLike(like);
                                    }
                                  }
                                },
                              );
                            },
                          ),
                          const SizedBox(width: 8),
                          Consumer(
                            builder: (context, ref, child) {
                              final likeCount = post.likedUserIds.length;

                              return Visibility(
                                visible: likeCount > 0,
                                child: Text(
                                  '$likeCount',
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.comment),
                            onPressed: focusNode.requestFocus,
                          ),
                          const SizedBox(width: 8),
                          Consumer(
                            builder: (context, ref, child) {
                              final commentCount = post.commentCount;

                              return Visibility(
                                visible: commentCount > 0,
                                child: Text(
                                  '${post.commentCount}',
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.video_call_rounded),
                        onPressed: () async {
                          await showModalBottomSheet<void>(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                            ),
                            builder: (context) => FractionallySizedBox(
                              heightFactor: 0.95,
                              child: ScheduleMeetingWidget(post: post),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 4),
                comments.when(
                  data: (comments) => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: comments.length,
                    itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundImage: CachedNetworkImageProvider(
                              comments[index].userPhotoUrl,
                            ),
                          ),
                          title: Text(
                            comments[index].userName,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          subtitle: Text(
                            timeago.format(comments[index].createdDate),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Text(
                            comments[index].text,
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (_, __) =>
                      const Center(child: CircularProgressIndicator()),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    maxLines: null,
                    focusNode: focusNode,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Add a comment',
                      hintStyle: TextStyle(fontSize: 18),
                    ),
                    onChanged: (text) {
                      commentState.value = text;
                    },
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final enabled = commentState.value.isNotEmpty;

                    return enabled
                        ? IconButton(
                            color: Theme.of(context).colorScheme.primary,
                            icon: const Icon(Icons.send_rounded),
                            onPressed: () async {
                              final user =
                                  ref.read(myUserProvider).asData?.value;
                              if (user != null) {
                                final comment = Comment(
                                  userName: user.name,
                                  userId: user.id,
                                  postId: post.id,
                                  userPhotoUrl: user.photoUrl,
                                  text: commentState.value,
                                  createdDate: DateTime.now(),
                                  id: '',
                                );
                                await ref
                                    .read(
                                      commentsOfPostProvider(postId).notifier,
                                    )
                                    .createComment(comment);
                                focusNode.unfocus();
                                textEditingController.clear();
                              }
                            },
                          )
                        : const IconButton(
                            icon: Icon(Icons.send_rounded),
                            onPressed: null,
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => const Center(child: CircularProgressIndicator()),
    );
  }
}
