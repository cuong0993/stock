import 'package:application/providers.dart';
import 'package:domain/user/user.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app/routes.dart';
import 'edit_user_widget.dart';

class UserPage extends StatelessWidget {
  const UserPage({
    required this.userId,
    Key? key,
  }) : super(key: key);
  final String userId;

  @override
  Widget build(BuildContext context) {
    final tabs = <String, Widget Function(User user)>{
      L10n.of(context)!.posts: (user) => Consumer(
            builder: (context, ref, child) {
              final posts = ref.watch(postsOfUserProvider(user));

              return posts.when(
                data: (posts) => ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final comment = posts[index];

                    return Text(comment.text);
                  },
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (_, __) =>
                    const Center(child: CircularProgressIndicator()),
              );
            },
          ),
      L10n.of(context)!.comments: (user) => Consumer(
            builder: (context, ref, child) {
              final comments = ref.watch(commentsOfUserProvider(user));

              return comments.when(
                data: (comments) => ListView.builder(
                  itemCount: comments.length,
                  itemBuilder: (context, index) {
                    final comment = comments[index];

                    return Text(comment.text);
                  },
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (_, __) =>
                    const Center(child: CircularProgressIndicator()),
              );
            },
          ),
    };

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(L10n.of(context)!.account),
        actions: [
          TextButton(
            onPressed: () {
              // TODO Log out.
            },
            child: Text(
              L10n.of(context)!.log_out,
            ),
          ),
        ],
      ),
      body: HookConsumer(
        builder: (context, ref, child) {
          final tabController = useTabController(initialLength: tabs.length);
          final user = ref.watch(userOfIdProvider(userId));
          final myUserId = ref.watch(myUserProvider).when(
                data: (data) => data.id,
                loading: () => null,
                error: (_, __) => null,
              );

          return user.when(
            data: (user) {
              final isMe = myUserId == user.id;

              return NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
                  SliverAppBar(
                    backgroundColor: Theme.of(context).cardColor,
                    leading: const SizedBox.shrink(),
                    expandedHeight: 400,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      background: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(user.photoUrl),
                                  radius: 40,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 32),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 130,
                                            child: Text(
                                              user.name,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text(
                                                'TODO Email',
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.notifications,
                                        ),
                                      ),
                                      if (isMe)
                                        IconButton(
                                          onPressed: () {
                                            SettingsRoute().go(context);
                                          },
                                          icon: const Icon(
                                            Icons.settings,
                                          ),
                                        )
                                      else
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.chat_bubble,
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Text(
                            'TODO About you',
                          ),
                          const SizedBox(height: 8),
                          Center(
                            child: ElevatedButton(
                              onPressed: () async {
                                final user =
                                    ref.read(myUserProvider).asData?.value;
                                if (user != null) {
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
                                      child: EditUserWidget(
                                        user: user,
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: Text(L10n.of(context)!.edit_profile),
                            ),
                          ),
                        ],
                      ),
                    ),
                    floating: true,
                    pinned: true,
                    bottom: TabBar(
                      isScrollable: true,
                      controller: tabController,
                      tabs: tabs.keys
                          .map(
                            (e) => Tab(
                              text: e,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
                body: TabBarView(
                  controller: tabController,
                  children: tabs.values.map((e) => e.call(user)).toList(),
                ),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, __) => const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
