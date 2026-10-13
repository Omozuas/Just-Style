import 'package:flutter/material.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/app/router/app_navigation.dart';
import 'package:juststyle/features/client/home/model/popular_stylist.dart';
import 'package:juststyle/features/client/home/view/widgets/popular_stylist_card.dart';

class PopularStylistList extends StatelessWidget {
  const PopularStylistList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 136.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        separatorBuilder: (_, _) => gapW(8),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => context.openStylistProfile(),
            child: PopularStylistCard(
              image: graceStylist.imageUrl,
              stylistName: graceStylist.name,
              profession: graceStylist.profession,
            ),
          );
        },
      ),
    );
  }
}
