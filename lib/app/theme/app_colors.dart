import 'package:flutter/material.dart';
import 'package:juststyle/app/theme/hex_color.dart';

enum AppTextColor {
  primary,
  secondary,
  muted,
  white,
  textMuted2,
  black,
  ultraBlack,
  brandOrange,
  brandYellow,
  textBlack3,
}

abstract final class AppColors {
  // Brand
  static final brandNavy = '#05051E'.toColor;
  static final brandOrange = '#FA5000'.toColor;
  static final brandHighlight = '#F35F1A'.toColor;
  static final brandPurple = '#5E19B3'.toColor;

  // Core
  static final primary = '#F7931E'.toColor;
  static final background = '#D0D0D0'.toColor;
  static final white = '#FFFFFF'.toColor;
  static final black = '#121212'.toColor;
  static final ultraBlack = '#1B1B1B'.toColor;
  static final black2 = '#000000'.toColor;
  static final black3 = '#363636'.toColor;
  static final black4 = '#232323'.toColor;
  static final black5 = '#1B1B23'.toColor;

  // Text
  static final textPrimary = '#2B2A30'.toColor;
  static final textSecondary = '#565560'.toColor;
  static final textMuted = '#82808F'.toColor;
  static final textMuted2 = '#6A7181'.toColor;
  static final textVerified = '#B1B0B9'.toColor;
  static final textBlack3 = '#333333'.toColor;
  static final textBrown = '#B35F00'.toColor;

  // UI
  static final border = '#E8E7EA'.toColor;
  static final divider = '#F3F3F4'.toColor;
  static final card = white;
  static final indicatorInactive = '#4A4A58'.toColor;

  // Bottom nav label colors
  static final navHome = '#F7931E'.toColor;
  static final navExplore = '#2196F3'.toColor;
  static final followBlue = '#0593FC'.toColor;
  static final navArtGallery = '#E54152'.toColor;
  static final navArtists = '#B49ACA'.toColor;
  static final navArtSupplies = '#ECBD2C'.toColor;

  // Artwork detail
  static final likesChipBackground = '#FFF4EB'.toColor;
  static final likesChipBorder = brandOrange;
  static final artworkHashtagBlue = '#3645C7'.toColor;

  // Trends / categories
  static final categoryComic = '#FF005C'.toColor;
  static final categoryGraffiti = '#8BC605'.toColor;
  static final categoryRecycleArt = '#87CED9'.toColor;
  static final categoryCalligraphy = '#F7931E'.toColor;
  static final trendsCardBackground = '#FAFAFA'.toColor;

  // Post / feed
  static final postCategory = '#FF18BE'.toColor;
  static final postLikeActive = '#FF0000'.toColor;
  static final postBookmarkActive = '#00AEFF'.toColor;
  static final postImagePlaceholder = '#F3F3F4'.toColor;
  static final postActionIcon = '#B1B0B9'.toColor;

  // Status
  static final success = '#15803D'.toColor;
  static final warning = '#F59E0B'.toColor;
  static final error = '#DC2626'.toColor;

  // Search bar
  static final searchBarBackground = '#F5F5F5'.toColor;

  // Post category colors
  static final illustrations = '#805333'.toColor;
  static final graffiti = '#8BC605'.toColor;
  static final watercolorPainting = '#A3983A'.toColor;
  static final handmade = '#05D8E5'.toColor;
  static final videography = '#A33A3A'.toColor;
  static final mixedMedia = '#FF18BE'.toColor;
  static final phoneography = '#3645C7'.toColor;
  static final comic = '#FF005C'.toColor;
  static final recycleArt = '#87CED9'.toColor;
  static final calligraphy = '#F7931E'.toColor;

  static Color textColor(AppTextColor type) => switch (type) {
    AppTextColor.primary => textPrimary,
    AppTextColor.secondary => textSecondary,
    AppTextColor.muted => textMuted,
    AppTextColor.textMuted2 => textMuted2,
    AppTextColor.white => white,
    AppTextColor.black => black,
    AppTextColor.ultraBlack => ultraBlack,
    AppTextColor.brandOrange => brandOrange,
    AppTextColor.textBlack3 => textBlack3,
    AppTextColor.brandYellow => categoryCalligraphy,
  };
}
