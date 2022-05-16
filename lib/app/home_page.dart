import 'package:application/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../meeting/meetings_widget.dart';
import '../post/posts_widget.dart';
import 'notification_utils.dart';
import 'routes.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

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
      () => <NavigationDestination, Widget>{
        const NavigationDestination(
          tooltip: '',
          icon: Icon(Icons.home_outlined),
          label: 'Posts',
          selectedIcon: Icon(Icons.home),
        ): const PostsWidget(),
        const NavigationDestination(
          tooltip: '',
          icon: Icon(Icons.search_outlined),
          label: 'Search',
          selectedIcon: Icon(Icons.search),
        ): const MeetingsWidget(),
        const NavigationDestination(
          tooltip: '',
          icon: Icon(Icons.add_box_outlined),
          label: 'Add',
          selectedIcon: Icon(Icons.add_box),
        ): const SizedBox.shrink(),
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
                  onPressed: () => UserRoute(userId: user.id).go(context),
                ),
                loading: () => const Icon(Icons.account_circle_rounded),
                error: (_, __) => IconButton(
                  icon: const Icon(Icons.account_circle_rounded),
                  onPressed: () => context.push(AuthenticationRoute().location),
                ),
              );
            },
          ),
        ],
      ),
      body: tabs.values.toList()[tabState.value],
      bottomNavigationBar: NavigationBar(
        selectedIndex: tabState.value,
        destinations: tabs.keys.toList(),
        onDestinationSelected: (index) {
          if (tabs.keys.toList()[index].label == 'Add') {
            final user = ref.read(myUserProvider).asData?.value;
            if (user != null) {
              context.push(CreatePostRoute().location);
            } else {
              context.push(RequireAuthenticationRoute().location);
            }
          } else {
            tabState.value = index;
          }
        },
      ),
    );
  }
}
