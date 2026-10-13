import 'package:flutter/material.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/app/router/app_navigation.dart';

import 'package:juststyle/app/theme/app_sizes.dart';
import 'package:juststyle/features/client/home/model/popular_stylist.dart';

import 'popular_stylist_card.dart';

class ListOfPopularStylist extends StatelessWidget {
  const ListOfPopularStylist({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      width: width,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: List.generate(7, (i) {
          return GestureDetector(
            onTap: () => context.openStylistProfile(),
            child: PopularStylistCard(
              image: graceStylist.imageUrl,
              stylistName: graceStylist.name,
              profession: graceStylist.profession,
            ),
          );
        }),
      ),
    );
  }
}
