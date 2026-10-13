import 'package:flutter/material.dart';
import 'package:juststyle/app/router/app_navigation.dart';
import 'package:juststyle/features/client/stylists/model/stylist.dart';
import 'package:juststyle/features/client/stylists/view/widgets/stylist_card.dart';

class ListOfStylist extends StatelessWidget {
  const ListOfStylist({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two items per row
        crossAxisSpacing: 30, // Horizontal space between items
        mainAxisSpacing: 12, // Vertical space between items
        childAspectRatio: 0.73, // Adjust the aspect ratio as needed
      ),
      itemCount: 12,
      itemBuilder: (context, i) {
        return GestureDetector(
          onTap: () => context.openStylistProfile(),
          child: StylistCard(
            image: jenniferStylist.imageUrl,
            name: jenniferStylist.name,
            rating: jenniferStylist.rating,
            profession: jenniferStylist.profession,
          ),
        );
      },
    );
  }
}
