import 'package:application/providers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../conversation/conversations_widget.dart';
import '../meeting/meetings_widget.dart';
import '../post/posts_widget.dart';
import 'notification_utils.dart';
import 'root_router.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        initializeNotification(context);

        return null;
      },
      [],
    );
    final tabs = useMemoized(
      () => <BottomNavigationBarItem, Widget>{
        const BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: 'Posts',
        ): const PostsWidget(),
        const BottomNavigationBarItem(
          icon: Icon(Icons.search_outlined),
          label: 'Search',
        ): const MeetingsWidget(),
        const BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'):
            const SizedBox.shrink(),
        const BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_rounded),
          label: 'Meetings',
        ): const MeetingsWidget(),
        const BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_rounded),
          label: 'Messages',
        ): const ConversationsWidget(),
      },
    );
    final tabState = useState(0);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stock',
        ),
        actions: [
          Consumer(
            builder: (context, ref, child) {
              final myUser = ref.watch(myUserProvider);

              return myUser.when(
                data: (user) => IconButton(
                  icon: ClipOval(
                    child: Image.network(
                      user.photoUrl,
                      errorBuilder: (context, exception, stackTrace) =>
                          const Icon(Icons.account_circle_rounded),
                    ),
                  ),
                  onPressed: () =>
                      AutoRouter.of(context).push(UserRoute(userId: user.id)),
                ),
                loading: () => const Icon(Icons.account_circle_rounded),
                error: (_, __) => IconButton(
                  icon: const Icon(Icons.account_circle_rounded),
                  onPressed: () =>
                      AutoRouter.of(context).push(const AuthenticationRoute()),
                ),
              );
            },
          ),
        ],
      ),
      body: tabs.values.toList()[tabState.value],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: tabState.value,
        items: tabs.keys.toList(),
        onTap: (index) {
          if (tabs.keys.toList()[index].label == 'Add') {
            final user = ref.read(myUserProvider).asData?.value;
            if (user != null) {
              AutoRouter.of(context).push(const CreatePostRoute());
            } else {
              AutoRouter.of(context).push(const RequireAuthenticationRoute());
            }
          } else {
            tabState.value = index;
          }
        },
      ),
    );
  }
}