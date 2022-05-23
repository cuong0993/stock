import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WalletWidget extends ConsumerWidget {
  const WalletWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => const Scrollbar(
        child: Center(child: CircularProgressIndicator()),
      );
}
