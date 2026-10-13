import 'package:juststyle/app/core/app_icon.dart';

class PopularStylist {
  const PopularStylist({
    required this.name,
    required this.profession,
    required this.imageUrl,
  });

  final String name;
  final String profession;
  final String imageUrl;
}

const graceStylist = PopularStylist(
  name: 'Grace',
  profession: 'Hair Stylist',
  imageUrl: AppIcon.homeStylistGrace,
);
