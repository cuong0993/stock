import 'package:application/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../market/market_widget.dart';
import '../wallet/wallet_widget.dart';
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
          icon: Icon(Icons.storefront_outlined),
          label: 'Market',
          selectedIcon: Icon(Icons.storefront),
        ): const MarketWidget(),
        const NavigationDestination(
          tooltip: '',
          icon: Icon(Icons.wallet),
          label: 'Wallet',
          selectedIcon: Icon(Icons.wallet_outlined),
        ): const WalletWidget(),
      },
    );
    final tabState = useState(0);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          L10n.of(context)!.app_name,
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
                  onPressed: () => UserRoute(userId: user.id).push(context),
                ),
                loading: () => const Icon(Icons.account_circle_rounded),
                error: (_, __) => IconButton(
                  icon: const Icon(Icons.account_circle_rounded),
                  onPressed: () => AuthenticationRoute().push(context),
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
          tabState.value = index;
        },
      ),
    );
  }
}
