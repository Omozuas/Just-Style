import 'package:flutter/material.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/features/client/home/model/braid.dart';
import 'package:juststyle/features/client/home/view/widgets/popular_braid_card.dart';

class PopularBraidGrid extends StatelessWidget {
  const PopularBraidGrid({super.key, this.count = 0});

  final int count;

  @override
  Widget build(BuildContext context) {
    final itemCount = count == 0 ? popularBraids.length : count;
    return LayoutBuilder(
      builder: (context, constraints) {
        const columns = 2;
        final spacing = 14.w;
        final tileWidth = (constraints.maxWidth - spacing) / columns;
        final imageHeight = tileWidth / PopularBraidCard.imageAspectRatio;
        final textHeight = screenSizeService.scaleText(14) * 1.5 * 2;
        final tileHeight = imageHeight + 8.h + textHeight;

        return GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: spacing,
            mainAxisSpacing: 16.h,
            mainAxisExtent: tileHeight,
          ),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            final braid = popularBraids[index % popularBraids.length];
            return PopularBraidCard(image: braid.imageUrl, name: braid.name);
          },
        );
      },
    );
  }
}
