import 'package:flutter/material.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/app/core/text/app_text.dart';
import 'package:juststyle/app/theme/app_colors.dart';
import 'package:juststyle/features/client/home/view/widgets/home_image.dart';

class PopularBraidCard extends StatelessWidget {
  const PopularBraidCard({super.key, required this.name, required this.image});

  final String name;
  final String image;

  static const imageAspectRatio = 168 / 140;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: imageAspectRatio,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: borderRadiusAll(12),
              image: DecorationImage(
                image: homeImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        gapH(8),
        SizedBox(
          height: screenSizeService.scaleText(14) * 1.5 * 2,
          child: Text(
            name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.paragraphMedium(textColor: AppColors.black2),
          ),
        ),
      ],
    );
  }
}
