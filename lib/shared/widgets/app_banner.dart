import 'package:flutter/material.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/app/core/text/app_text.dart';
import 'package:juststyle/app/theme/app_colors.dart';
import 'package:juststyle/app/theme/global_colors.dart';
import 'package:juststyle/shared/widgets/app_button.dart';

class AppBanner extends StatelessWidget {
  const AppBanner({
    super.key,
    required this.image,
    required this.title,
    this.caption,
    this.highlight,
    this.buttonLabel,
    this.onPressed,
  });

  final ImageProvider image;
  final String title;
  final String? caption;
  final String? highlight;
  final String? buttonLabel;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: borderRadiusAll(16),
        boxShadow: [
          BoxShadow(
            color: deemYellow.withValues(alpha: 0.28),
            blurRadius: 18,
            spreadRadius: 1,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: borderRadiusAll(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image(image: image, fit: BoxFit.cover),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0x8C3A3A3A), Color(0x333A3A3A)],
                ),
              ),
            ),
            Padding(
              padding: paddingOnly(left: 18, top: 18, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyle.labelLarge(
                      textColor: AppColors.white,
                      fontSize: 16,
                      strong: true,
                    ),
                  ),
                  if (caption != null || highlight != null) ...[
                    gapH(6),
                    Text.rich(
                      TextSpan(
                        style: AppTextStyle.paragraphSmall(
                          textColor: AppColors.white,
                        ),
                        children: [
                          if (caption != null) TextSpan(text: '$caption  '),
                          if (highlight != null)
                            TextSpan(
                              text: highlight,
                              style: AppTextStyle.labelLarge(
                                textColor: AppColors.white,
                                fontSize: 18,
                                strong: true,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                  if (buttonLabel != null) ...[
                    gapH(22),
                    SizedBox(
                      width: 80.w,
                      child: AppButton(
                        text: buttonLabel!,
                        onPressed: onPressed ?? () {},
                        expand: false,
                        height: 28,
                        radius: 14,
                        vertical: 0,
                        horizontal: 16,
                        fontSize: 12,
                        backgroundColor: deemYellow,
                        foregroundColor: AppColors.white,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
