import 'package:juststyle/app/core/app_icon.dart';

class Braid {
  const Braid({required this.name, required this.imageUrl});

  final String name;
  final String imageUrl;
}

const popularBraids = [
  Braid(name: 'Top Knot Braids', imageUrl: AppIcon.homeBraidTopKnot),
  Braid(
    name: 'Pulled-Back Cornrow Braids',
    imageUrl: AppIcon.homeBraidCornrow,
  ),
  Braid(name: 'Long Locs', imageUrl: AppIcon.homeBraidLocs),
  Braid(name: 'Box Braids', imageUrl: AppIcon.homeOffer),
];
