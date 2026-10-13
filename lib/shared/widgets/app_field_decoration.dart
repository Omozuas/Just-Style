import 'package:flutter/material.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/app/core/text/app_text.dart';
import 'package:juststyle/app/theme/app_colors.dart';
import 'package:juststyle/app/theme/hex_color.dart';

final Color appFieldBorder = '#E4E4E4'.toColor;

class AppFieldLabel extends StatelessWidget {
  const AppFieldLabel(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyle.paragraphLarge(textColor: AppColors.black2),
    );
  }
}

InputDecoration appFieldDecoration({required String hint, Widget? suffixIcon}) {
  final borderRadius = borderRadiusAll(12);
  final hintStyle = AppTextStyle.paragraphMedium(textColor: AppColors.textMuted);

  OutlineInputBorder outline(Color color, {double width = 1}) {
    return OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(color: color, width: width),
    );
  }

  return InputDecoration(
    hintText: hint,
    hintStyle: hintStyle,
    suffixIcon: suffixIcon,
    contentPadding: paddingSymmetric(horizontal: 16, vertical: 14),
    enabledBorder: outline(appFieldBorder),
    focusedBorder: outline(AppColors.black2),
    errorBorder: outline(AppColors.error),
    focusedErrorBorder: outline(AppColors.error),
    errorStyle: AppTextStyle.paragraphSmall(textColor: AppColors.error),
  );
}
