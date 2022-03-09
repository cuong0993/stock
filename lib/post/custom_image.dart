import 'package:cached_network_image/cached_network_image.dart';
import 'package:data/service_locator.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    required this.imageUrl,
    Key? key,
  }) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
        imageUrl: imageUrl,
        cacheManager: getIt.get(),
        errorWidget: (context, url, dynamic error) =>
            const Icon(Icons.warning_rounded),
        progressIndicatorBuilder: (context, url, progress) =>
            Center(child: CircularProgressIndicator(value: progress.progress)),
        fit: BoxFit.cover,
      );
}
