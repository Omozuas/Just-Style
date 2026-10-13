import 'package:flutter/material.dart';

extension HexColor on String {
  /// Converts a hex string (`#RGB`, `#RRGGBB`, `#AARRGGBB`) into a [Color].
  /// Invalid values fall back to a light grey.
  Color get toColor => toColorOr(fallback: const Color(0xFFE0E0E0));

  /// Converts this hex string to a [Color], or [fallback] if parsing fails.
  Color toColorOr({Color fallback = const Color(0xFFE0E0E0)}) {
    return tryToColor() ?? fallback;
  }

  /// Same as [toColor], but returns `null` when parsing fails.
  Color? tryToColor() {
    var hex = trim().replaceAll('#', '').toUpperCase();
    if (hex.isEmpty) return null;

    if (hex.length == 3) {
      hex = hex.split('').map((c) => '$c$c').join();
    }

    if (hex.length == 6) {
      hex = 'FF$hex';
    }

    if (hex.length != 8) return null;

    final value = int.tryParse(hex, radix: 16);
    if (value == null) return null;
    return Color(value);
  }
}
