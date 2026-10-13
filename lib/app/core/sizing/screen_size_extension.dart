import 'package:flutter/material.dart';
import 'package:juststyle/core/locator/service_locator.dart';

export 'package:juststyle/app/core/sizing/screen_size_service.dart';
export 'package:juststyle/core/locator/service_locator.dart' show screenSizeService;

/// Figma-based scaling shortcuts on numbers.
///
/// ```dart
/// width: 212.w,
/// height: 380.h,
/// fontSize: 16.sp,
/// padding: paddingSymmetric(horizontal: 24),
/// padding: paddingAll(16),
/// 24.verticalGap,
/// ```
extension ScreenSizeExtension on num {
  double get w => screenSizeService.scaleW(toDouble());

  double get h => screenSizeService.scaleH(toDouble());

  double get sc => screenSizeService.scaleSpace(toDouble());

  double get sp => screenSizeService.scaleText(toDouble());

  double get r => screenSizeService.scaleRadius(toDouble());

  double get ic => screenSizeService.scaleIcon(toDouble());

  SizedBox get horizontalGap => SizedBox(width: w);

  SizedBox get verticalGap => SizedBox(height: h);

  EdgeInsets get paddingAll => EdgeInsets.all(sc);

  BorderRadius get borderRadiusAll => BorderRadius.circular(r);

  Radius get radiusCircular => Radius.circular(r);

  /// Physical pixels for image decode cache (memCacheWidth / memCacheHeight).
  int? get memCachePx {
    final value = toDouble();
    if (!value.isFinite || value <= 0) return null;
    return screenSizeService.scalePx(value).round();
  }
}

EdgeInsets paddingSymmetric({double horizontal = 0, double vertical = 0}) {
  return EdgeInsets.symmetric(horizontal: horizontal.w, vertical: vertical.h);
}

EdgeInsets paddingOnly({
  double left = 0,
  double top = 0,
  double right = 0,
  double bottom = 0,
}) {
  return EdgeInsets.only(
    left: left.w,
    top: top.h,
    right: right.w,
    bottom: bottom.h,
  );
}

EdgeInsets paddingAll(double value) => EdgeInsets.all(value.sc);

SizedBox gapH(double value) => SizedBox(height: value.h);

SizedBox gapW(double value) => SizedBox(width: value.w);

SizedBox gapSc(double value) => SizedBox(height: value.sc);

BorderRadius borderRadiusAll(double value) => BorderRadius.circular(value.r);

BorderRadius borderRadiusOnly({
  double topLeft = 0,
  double topRight = 0,
  double bottomLeft = 0,
  double bottomRight = 0,
}) => BorderRadius.only(
  topLeft: Radius.circular(topLeft.r),
  topRight: Radius.circular(topRight.r),
  bottomLeft: Radius.circular(bottomLeft.r),
  bottomRight: Radius.circular(bottomRight.r),
);

/// Physical screen width in pixels for full-width image decode cache.
int? screenMemCacheWidthPx() {
  if (!screenSizeService.isInitialized) return null;
  return screenSizeService.scalePx(screenSizeService.screenWidth).round();
}

/// Physical screen height in pixels for full-height image decode cache.
int? screenMemCacheHeightPx() {
  if (!screenSizeService.isInitialized) return null;
  return screenSizeService.scalePx(screenSizeService.screenHeight).round();
}
