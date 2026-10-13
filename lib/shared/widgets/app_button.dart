import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/app/core/text/app_text.dart';
import 'package:juststyle/app/theme/app_colors.dart';

enum ButtonVariant {
  primary,
  disabled,
  secondary,
  transparent,
  light,
  ghostLight,
  navy,
}

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.iconPath,
    this.iconPath2,
    this.variant = ButtonVariant.primary,
    this.radius = 8,
    this.vertical = 12,
    this.horizontal = 16,
    this.height = 50,
    this.fontSize = 16,
    this.isLoading = false,
    this.expand = true,
  });

  final String text;
  final String? iconPath;
  final String? iconPath2;
  final ButtonVariant variant;
  final double radius;
  final VoidCallback? onPressed;
  final double vertical;
  final double horizontal;
  final double height;
  final double fontSize;
  final bool isLoading;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final bool isDisabled =
        variant == ButtonVariant.disabled || onPressed == null;

    final Color backgroundColor = switch (variant) {
      ButtonVariant.primary => AppColors.black2,
      ButtonVariant.secondary => AppColors.white,
      ButtonVariant.transparent => Colors.transparent,
      ButtonVariant.disabled => AppColors.background,
      ButtonVariant.light => AppColors.white,
      ButtonVariant.ghostLight => Colors.transparent,
      ButtonVariant.navy => AppColors.black2,
    };

    final Color textColor = switch (variant) {
      ButtonVariant.primary => AppColors.white,
      ButtonVariant.secondary => AppColors.black2,
      ButtonVariant.transparent => AppColors.black2,
      ButtonVariant.disabled => AppColors.white,
      ButtonVariant.light => AppColors.black2,
      ButtonVariant.ghostLight => AppColors.white,
      ButtonVariant.navy => AppColors.white,
    };

    final Color borderColor = switch (variant) {
      ButtonVariant.transparent => AppColors.black2,
      ButtonVariant.secondary => AppColors.black2,
      ButtonVariant.light => AppColors.black2,
      _ => Colors.transparent,
    };

    return GestureDetector(
      onTap: isLoading || isDisabled ? null : onPressed,
      child: Container(
        width: expand ? double.infinity : null,
        height: height.h,
        padding: screenSizeService.scalePaddingSymmetric(
          vertical: vertical,
          horizontal: horizontal,
        ),
        decoration: BoxDecoration(
          color: isLoading ? AppColors.background : backgroundColor,
          borderRadius: borderRadiusAll(radius),
          border: borderColor == Colors.transparent
              ? null
              : Border.all(color: borderColor),
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                  width: 22.w,
                  height: 22.h,
                  child: CircularProgressIndicator.adaptive(
                    strokeWidth: 3.w,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.black2),
                  ),
                )
              : Row(
                  mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (iconPath2 != null) ...[
                      SvgPicture.asset(iconPath2!, height: 20.h, width: 20.w),
                      gapW(6),
                    ],
                    if (expand)
                      Flexible(
                        child: Text(
                          text,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.labelLarge(
                            fontSize: fontSize,
                            textColor: textColor,
                            strong: true,
                          ),
                        ),
                      )
                    else
                      Text(
                        text,
                        style: AppTextStyle.labelLarge(
                          fontSize: fontSize,
                          textColor: textColor,
                          strong: true,
                        ),
                      ),
                    if (iconPath != null) ...[
                      gapW(6),
                      SvgPicture.asset(iconPath!, height: 20.h, width: 20.w),
                    ],
                  ],
                ),
        ),
      ),
    );
  }
}
