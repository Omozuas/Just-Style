import 'package:flutter/material.dart';
import 'package:juststyle/app/views/client/stylist_client_screen/widgets/stylist_card.dart';

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
        return StylistCard(
          image:
              "https://s3-alpha-sig.figma.com/img/908d/0daf/092c57497be6558a14e7abc950401e66?Expires=1744588800&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=LBfdUt8BhnK4NZQvsjY1POo9Mc7j5VRGIrcmzGdn1YDN9FhHYFkadigDp2QzKK2TeltWkKgR9wuR0qBIg87cujQ2aochBXQGPhpkR-w~FtojSqVz51XvbIgPlJ3LQ9lPEJAPdJNPJfV7K0rRlLfcIiMvmQhY4u~uR9EmvIwnO4JNd9qLZaC8O-nW-fPLu50yYjevdNj8Xp63cxRFLE0tyCFrEQ3gQYx8sy4~90JuK7~d4P7vyvzxyMfAdRQWujAlH0Rw4BxJ5nT9MvGYnpbSU8Feixs3uKUqX~4P7oYora3Eq0ja45GB8510L9txytp59hh9hXIsjJ-j1e9NZqxXNA__",
          name: "Jennifa",
          rating: "4.9",
          profession: "Hair Stylist",
        );
      },
    );
  }
}
