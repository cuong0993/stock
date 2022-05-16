import 'package:application/providers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain/post/like/like.dart';
import 'package:domain/post/post.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:readmore/readmore.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../app/routes.dart';
import 'post_images_grid_widget.dart';
import 'tag_chip_widget.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    required this.liked,
    required this.post,
    super.key,
  });
  final bool liked;
  final Post post;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: GestureDetector(
          onTap: () => DetailPostRoute(postId: post.id).go(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => UserRoute(userId: post.userId).go(context),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      if (post.userPhotoUrl.isNotEmpty)
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: const Color(0xff4D4D4D),
                          backgroundImage:
                              CachedNetworkImageProvider(post.userPhotoUrl),
                        )
                      else
                        const CircleAvatar(
                          radius: 24,
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
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            timeago.format(post.createdDate),
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  post.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: ReadMoreText(
                  post.text,
                  style: Theme.of(context).textTheme.bodyText2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'more',
                  trimExpandedText: '',
                  moreStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              PostImagesGridWidget(
                post: post,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Wrap(
                  spacing: 4,
                  runSpacing: 2,
                  children: post.tags
                      .map(
                        (e) => TagChipWidget(text: e),
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
                          builder: (context, ref, child) => IconButton(
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
                          ),
                        ),
                        const SizedBox(width: 8),
                        Visibility(
                          visible: post.likedUserIds.isNotEmpty,
                          child: Text(
                            '${post.likedUserIds.length}',
                            overflow: TextOverflow.fade,
                            softWrap: false,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.comment),
                          onPressed: () => DetailPostRoute(
                            postId: post.id,
                          ).go(context),
                        ),
                        const SizedBox(width: 8),
                        Visibility(
                          visible: post.commentCount > 0,
                          child: Text(
                            '${post.commentCount}',
                            overflow: TextOverflow.fade,
                            softWrap: false,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
