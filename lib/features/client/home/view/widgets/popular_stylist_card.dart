import 'package:flutter/material.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/app/core/text/app_text.dart';
import 'package:juststyle/app/theme/app_colors.dart';
import 'package:juststyle/features/client/home/view/widgets/home_image.dart';

class PopularStylistCard extends StatelessWidget {
  const PopularStylistCard({
    super.key,
    required this.image,
    required this.stylistName,
    required this.profession,
  });

  final String image;
  final String stylistName;
  final String profession;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 84.w,
      child: Column(
        children: [
          Container(
            height: 72.w,
            width: 72.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: homeImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          gapH(8),
          Text(
            stylistName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppTextStyle.paragraphMedium(
              textColor: AppColors.black2,
              strong: true,
            ),
          ),
          Text(
            profession,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppTextStyle.paragraphSmall(textColor: AppColors.textMuted),
          ),
        ],
      ),
    );
  }
}
