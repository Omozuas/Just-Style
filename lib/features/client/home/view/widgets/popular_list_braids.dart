import 'package:flutter/material.dart';
import 'package:juststyle/features/client/home/model/braid.dart';

import 'popular_braids_card.dart';

class PopularListBraids extends StatelessWidget {
  const PopularListBraids({super.key, this.num = 0});
  final int? num;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two items per row
        crossAxisSpacing: 30, // Horizontal space between items
        mainAxisSpacing: 12, // Vertical space between items
        childAspectRatio: 0.85, // Adjust the aspect ratio as needed
      ),
      itemCount: num != 0 ? num : 12,
      itemBuilder: (context, i) {
        return GestureDetector(
          onTap: () {},
          child: PopularBraidsCard(
            image: topKnotBraids.imageUrl,
            name: topKnotBraids.name,
          ),
        );
      },
    );
  }
}
