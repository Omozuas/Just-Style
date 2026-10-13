import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/app/core/text/app_text.dart';
import 'package:juststyle/app/theme/app_colors.dart';
import 'package:juststyle/features/onboarding/model/onboarding_page.dart';

class OnboardingPageBody extends StatelessWidget {
  const OnboardingPageBody({super.key, required this.page});

  final OnboardingPage page;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(page.image, height: 280.h, fit: BoxFit.contain),
        gapH(28),
        Text(
          page.title,
          textAlign: TextAlign.center,
          style: AppTextStyle.headingSmall(textColor: AppColors.black2),
        ),
        gapH(8),
        Text(
          page.description,
          textAlign: TextAlign.center,
          style: AppTextStyle.paragraphMedium(
            textColor: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
