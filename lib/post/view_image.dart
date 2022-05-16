import 'package:cached_network_image/cached_network_image.dart';
import 'package:data/service_locator.dart';
import 'package:domain/post/post.dart';
import 'package:flutter/material.dart';

class ViewImage extends StatelessWidget {
  const ViewImage({
    required this.post,
    required this.index,
    super.key,
  });
  final Post post;
  final int index;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: CachedNetworkImage(
            imageUrl: post.images[index],
            cacheManager: getIt.get(),
            progressIndicatorBuilder: (context, url, progress) => Center(
              child: CircularProgressIndicator(value: progress.progress),
            ),
            // ignore: avoid-dynamic
            errorWidget: (context, url, dynamic error) =>
                const Icon(Icons.warning_rounded),
            fit: BoxFit.cover,
          ),
        ),
      );
}
