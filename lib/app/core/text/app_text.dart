import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:juststyle/app/core/sizing/app_font_sizes.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/app/core/text/app_fonts.dart';
import 'package:juststyle/app/theme/app_colors.dart';

abstract final class AppTextStyle {
  static TextStyle _base({
    required double fontSize,
    AppTextColor color = AppTextColor.primary,
    Color? textColor,
    String fontFamily = AppFonts.primary,
    FontWeight fontWeight = FontWeight.w400,
    double lineHeightEm = 1.5,
    double letterSpacingEm = 0,
    TextDecoration? decoration,
    bool scale = true,
  }) {
    final resolvedSize = scale
        ? screenSizeService.scaleText(fontSize)
        : fontSize;

    final style = TextStyle(
      fontSize: resolvedSize,
      color: textColor ?? AppColors.textColor(color),
      fontWeight: fontWeight,
      height: lineHeightEm,
      letterSpacing: letterSpacingEm * resolvedSize,
      decoration: decoration,
    );

    return _applyFont(fontFamily, style);
  }

  static TextStyle _applyFont(String fontFamily, TextStyle style) {
    return switch (fontFamily) {
      AppFonts.inter => GoogleFonts.inter(textStyle: style),
      AppFonts.manrope => GoogleFonts.manrope(textStyle: style),
      AppFonts.roboto => GoogleFonts.roboto(textStyle: style),
      AppFonts.nunito => GoogleFonts.nunito(textStyle: style),
      AppFonts.poppins => GoogleFonts.poppins(textStyle: style),
      _ => style.copyWith(fontFamily: fontFamily),
    };
  }

  static TextStyle displayLarge({
    double? fontSize,
    AppTextColor color = AppTextColor.primary,
    Color? textColor,
    String fontFamily = AppFonts.primary,
    FontWeight fontWeight = FontWeight.w400,
    bool scale = true,
  }) => _base(
    fontSize: fontSize ?? AppFontSize.displayLarge,
    color: color,
    textColor: textColor,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    lineHeightEm: 1.1,
    scale: scale,
  );

  static TextStyle displayMedium({
    double? fontSize,
    AppTextColor color = AppTextColor.primary,
    Color? textColor,
    String fontFamily = AppFonts.primary,
    FontWeight fontWeight = FontWeight.w400,
    bool scale = true,
  }) => _base(
    fontSize: fontSize ?? AppFontSize.displayMedium,
    color: color,
    textColor: textColor,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    lineHeightEm: 1.1,
    scale: scale,
  );

  static TextStyle displaySmall({
    double? fontSize,
    AppTextColor color = AppTextColor.primary,
    Color? textColor,
    String fontFamily = AppFonts.primary,
    FontWeight fontWeight = FontWeight.w400,
    bool scale = true,
  }) => _base(
    fontSize: fontSize ?? AppFontSize.displaySmall,
    color: color,
    textColor: textColor,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    lineHeightEm: 1.1,
    scale: scale,
  );

  static TextStyle headingXLarge({
    double? fontSize,
    AppTextColor color = AppTextColor.primary,
    Color? textColor,
    String fontFamily = AppFonts.primary,
    FontWeight fontWeight = FontWeight.w600,
    bool scale = true,
  }) => _base(
    fontSize: fontSize ?? AppFontSize.headingXLarge,
    color: color,
    textColor: textColor,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    lineHeightEm: 1.3,
    letterSpacingEm: -0.025,
    scale: scale,
  );

  static TextStyle headingLarge({
    double? fontSize,
    AppTextColor color = AppTextColor.primary,
    Color? textColor,
    String fontFamily = AppFonts.primary,
    FontWeight fontWeight = FontWeight.w600,
    bool scale = true,
  }) => _base(
    fontSize: fontSize ?? AppFontSize.headingLarge,
    color: color,
    textColor: textColor,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    lineHeightEm: 1.38,
    letterSpacingEm: -0.01,
    scale: scale,
  );

  static TextStyle headingMedium({
    double? fontSize,
    AppTextColor color = AppTextColor.primary,
    Color? textColor,
    String fontFamily = AppFonts.primary,
    FontWeight fontWeight = FontWeight.w600,
    bool scale = true,
  }) => _base(
    fontSize: fontSize ?? AppFontSize.headingMedium,
    color: color,
    textColor: textColor,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    lineHeightEm: 1.29,
    letterSpacingEm: -0.01,
    scale: scale,
  );

  static TextStyle headingSmall({
    double? fontSize,
    AppTextColor color = AppTextColor.primary,
    Color? textColor,
    String fontFamily = AppFonts.primary,
    FontWeight fontWeight = FontWeight.w600,
    bool scale = true,
  }) => _base(
    fontSize: fontSize ?? AppFontSize.headingSmall,
    color: color,
    textColor: textColor,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    lineHeightEm: 1.33,
    letterSpacingEm: -0.01,
    scale: scale,
  );

  static TextStyle headingXSmall({
    double? fontSize,
    AppTextColor color = AppTextColor.primary,
    Color? textColor,
    String fontFamily = AppFonts.primary,
    FontWeight fontWeight = FontWeight.w600,
    bool scale = true,
  }) => _base(
    fontSize: fontSize ?? AppFontSize.headingXSmall,
    color: color,
    textColor: textColor,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    lineHeightEm: 1.25,
    letterSpacingEm: -0.01,
    scale: scale,
  );

  static TextStyle headingXxSmall({
    double? fontSize,
    AppTextColor color = AppTextColor.primary,
    Color? textColor,
    String fontFamily = AppFonts.primary,
    FontWeight fontWeight = FontWeight.w600,
    bool scale = true,
  }) => _base(
    fontSize: fontSize ?? AppFontSize.headingXxSmall,
    color: color,
    textColor: textColor,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    lineHeightEm: 1.1,
    letterSpacingEm: 0.05,
    scale: scale,
  );

  static TextStyle headingXxxSmall({
    double? fontSize,
    AppTextColor color = AppTextColor.primary,
    Color? textColor,
    String fontFamily = AppFonts.primary,
    FontWeight fontWeight = FontWeight.w600,
    bool scale = true,
  }) => _base(
    fontSize: fontSize ?? AppFontSize.headingXxxSmall,
    color: color,
    textColor: textColor,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    lineHeightEm: 1.1,
    letterSpacingEm: 0.05,
    scale: scale,
  );

  static TextStyle paragraphLarge({
    double? fontSize,
    AppTextColor color = AppTextColor.primary,
    Color? textColor,
    String fontFamily = AppFonts.primary,
    bool strong = false,
    bool scale = true,
  }) => _base(
    fontSize: fontSize ?? AppFontSize.paragraphLarge,
    color: color,
    textColor: textColor,
    fontFamily: fontFamily,
    fontWeight: strong ? FontWeight.w600 : FontWeight.w400,
    lineHeightEm: 1.5,
    scale: scale,
  );

  static TextStyle paragraphMedium({
    double? fontSize,
    AppTextColor color = AppTextColor.primary,
    Color? textColor,
    String fontFamily = AppFonts.primary,
    bool strong = false,
    bool scale = true,
  }) => _base(
    fontSize: fontSize ?? AppFontSize.paragraphMedium,
    color: color,
    textColor: textColor,
    fontFamily: fontFamily,
    fontWeight: strong ? FontWeight.w600 : FontWeight.w400,
    lineHeightEm: 1.5,
    letterSpacingEm: 0.01,
    scale: scale,
  );

  static TextStyle paragraphSmall({
    double? fontSize,
    AppTextColor color = AppTextColor.primary,
    Color? textColor,
    String fontFamily = AppFonts.primary,
    bool strong = false,
    bool scale = true,
  }) => _base(
    fontSize: fontSize ?? AppFontSize.paragraphSmall,
    color: color,
    textColor: textColor,
    fontFamily: fontFamily,
    fontWeight: strong ? FontWeight.w600 : FontWeight.w400,
    lineHeightEm: 1.5,
    letterSpacingEm: 0.01,
    scale: scale,
  );

  static TextStyle labelLarge({
    double? fontSize,
    AppTextColor color = AppTextColor.primary,
    Color? textColor,
    String fontFamily = AppFonts.primary,
    bool strong = false,
    bool scale = true,
  }) => _base(
    fontSize: fontSize ?? AppFontSize.labelLarge,
    color: color,
    textColor: textColor,
    fontFamily: fontFamily,
    fontWeight: strong ? FontWeight.w600 : FontWeight.w400,
    lineHeightEm: 1.25,
    scale: scale,
  );

  static TextStyle labelMedium({
    double? fontSize,
    AppTextColor color = AppTextColor.primary,
    Color? textColor,
    String fontFamily = AppFonts.primary,
    bool strong = false,
    bool scale = true,
  }) => _base(
    fontSize: fontSize ?? AppFontSize.labelMedium,
    color: color,
    textColor: textColor,
    fontFamily: fontFamily,
    fontWeight: strong ? FontWeight.w600 : FontWeight.w400,
    lineHeightEm: 1.25,
    letterSpacingEm: 0.01,
    scale: scale,
  );

  static TextStyle labelSmall({
    double? fontSize,
    AppTextColor color = AppTextColor.primary,
    Color? textColor,
    String fontFamily = AppFonts.primary,
    bool strong = false,
    bool scale = true,
  }) => _base(
    fontSize: fontSize ?? AppFontSize.labelSmall,
    color: color,
    textColor: textColor,
    fontFamily: fontFamily,
    fontWeight: strong ? FontWeight.w600 : FontWeight.w400,
    lineHeightEm: 1.25,
    letterSpacingEm: 0.01,
    scale: scale,
  );

  static TextStyle labelXSmall({
    double? fontSize,
    AppTextColor color = AppTextColor.primary,
    Color? textColor,
    String fontFamily = AppFonts.primary,
    bool strong = false,
    bool scale = true,
  }) => _base(
    fontSize: fontSize ?? AppFontSize.labelXSmall,
    color: color,
    textColor: textColor,
    fontFamily: fontFamily,
    fontWeight: strong ? FontWeight.w600 : FontWeight.w400,
    lineHeightEm: 1.25,
    letterSpacingEm: 0.025,
    scale: scale,
  );

  static TextStyle custom({
    required double fontSize,
    AppTextColor color = AppTextColor.primary,
    Color? textColor,
    String fontFamily = AppFonts.primary,
    FontWeight fontWeight = FontWeight.w400,
    double lineHeightEm = 1.5,
    double letterSpacingEm = 0,
    TextDecoration? decoration,
    bool scale = true,
  }) => _base(
    fontSize: fontSize,
    color: color,
    textColor: textColor,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    lineHeightEm: lineHeightEm,
    letterSpacingEm: letterSpacingEm,
    decoration: decoration,
    scale: scale,
  );
}
