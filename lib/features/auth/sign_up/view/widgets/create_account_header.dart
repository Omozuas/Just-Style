import 'package:flutter/material.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/app/core/text/app_text.dart';
import 'package:juststyle/app/theme/app_colors.dart';

class CreateAccountHeader extends StatelessWidget {
  const CreateAccountHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Create Account',
          textAlign: TextAlign.center,
          style: AppTextStyle.headingLarge(
            textColor: AppColors.black2,
            fontWeight: FontWeight.w700,
          ),
        ),
        gapH(8),
        Text(
          'Kindly enter your login details to continue',
          textAlign: TextAlign.center,
          style: AppTextStyle.paragraphMedium(
            textColor: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
