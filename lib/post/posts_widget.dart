import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostsWidget extends ConsumerWidget {
  const PostsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => const Scrollbar(
        child: Center(child: CircularProgressIndicator()),
      );
}
