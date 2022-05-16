import 'package:application/providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'post_widget.dart';

class PostsWidget extends ConsumerWidget {
  const PostsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(myPostsProvider);
    final myUserId = ref.watch(myUserProvider).when(
          data: (data) => data.id,
          loading: () => null,
          error: (_, __) => null,
        );

    return Scrollbar(
      child: posts.when(
        data: (posts) => ListView.separated(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];

            return PostWidget(
              liked:
                  !(myUserId == null) && post.likedUserIds.contains(myUserId),
              post: post,
            );
          },
          separatorBuilder: (context, index) => const Divider(thickness: 2),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
