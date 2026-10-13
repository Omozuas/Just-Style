import 'package:flutter/material.dart';
import 'package:juststyle/app/core/text/app_text.dart';
import 'package:juststyle/app/theme/app_colors.dart';

class HomeSectionTitle extends StatelessWidget {
  const HomeSectionTitle({
    super.key,
    required this.title,
    this.showSeeAll = false,
    this.onSeeAll,
  });

  final String title;
  final bool showSeeAll;
  final VoidCallback? onSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: AppTextStyle.headingXSmall(
              textColor: AppColors.black2,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        if (showSeeAll)
          GestureDetector(
            onTap: onSeeAll,
            child: Text(
              'See All',
              style: AppTextStyle.paragraphSmall(
                textColor: AppColors.textMuted,
              ),
            ),
          ),
      ],
    );
  }
}
