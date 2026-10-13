import 'package:flutter/material.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/app/core/text/app_text.dart';
import 'package:juststyle/app/theme/app_colors.dart';
import 'package:juststyle/app/theme/global_colors.dart';

class VerifyCodeHeader extends StatelessWidget {
  const VerifyCodeHeader({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Verify Code',
          textAlign: TextAlign.center,
          style: AppTextStyle.headingLarge(
            textColor: AppColors.black2,
            fontWeight: FontWeight.w700,
          ),
        ),
        gapH(12),
        Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            style: AppTextStyle.paragraphMedium(textColor: AppColors.black2),
            children: [
              const TextSpan(
                text: 'Please enter the code we sent to your email address ',
              ),
              TextSpan(
                text: email,
                style: AppTextStyle.paragraphMedium(textColor: blue),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
