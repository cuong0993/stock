import 'package:animations/animations.dart';
import 'package:domain/post/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'custom_image.dart';
import 'view_image.dart';

class PostImagesGridWidget extends StatelessWidget {
  const PostImagesGridWidget({
    required this.post,
    Key? key,
  }) : super(key: key);

  static const maxAxisCount = 6;
  static const halfAxisCount = maxAxisCount ~/ 2;
  static const oneThirdAxisCount = maxAxisCount ~/ 3;
  static const twoThirdAxisCount = (maxAxisCount ~/ 3) * 2;
  static const tilesLayouts = [
    <GridTile>[],
    [
      GridTile(maxAxisCount, maxAxisCount),
    ],
    [
      GridTile(halfAxisCount, maxAxisCount),
      GridTile(halfAxisCount, maxAxisCount),
    ],
    [
      GridTile(maxAxisCount, halfAxisCount),
      GridTile(halfAxisCount, halfAxisCount),
      GridTile(halfAxisCount, halfAxisCount),
    ],
    [
      GridTile(maxAxisCount, twoThirdAxisCount),
      GridTile(oneThirdAxisCount, oneThirdAxisCount),
      GridTile(oneThirdAxisCount, oneThirdAxisCount),
      GridTile(oneThirdAxisCount, oneThirdAxisCount),
    ],
    [
      GridTile(halfAxisCount, twoThirdAxisCount),
      GridTile(halfAxisCount, twoThirdAxisCount),
      GridTile(oneThirdAxisCount, oneThirdAxisCount),
      GridTile(oneThirdAxisCount, oneThirdAxisCount),
      GridTile(oneThirdAxisCount, oneThirdAxisCount),
    ],
  ];
  final Post post;

  @override
  Widget build(BuildContext context) => post.images.isNotEmpty
      ? () {
          final images = post.images.length < tilesLayouts.length
              ? post.images
              : post.images.sublist(0, tilesLayouts.length - 1);
          final tileLayout = tilesLayouts[images.length];

          return StaggeredGrid.count(
            crossAxisCount: maxAxisCount,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            children: [
              ...images.asMap().entries.map((e) {
                final index = e.key;

                return StaggeredGridTile.count(
                  crossAxisCellCount: tileLayout[index].crossAxisCount,
                  mainAxisCellCount: tileLayout[index].mainAxisCount,
                  child: OpenContainer(
                    openBuilder: (context, _) =>
                        ViewImage(post: post, index: index),
                    closedShape: const RoundedRectangleBorder(),
                    closedBuilder: (context, openContainer) =>
                        CustomImage(imageUrl: images[index]),
                  ),
                );
              }),
            ],
          );
        }()
      : const SizedBox.shrink();
}

class GridTile {
  const GridTile(this.crossAxisCount, this.mainAxisCount);

  final int crossAxisCount;
  final int mainAxisCount;
}
