import 'package:flutter/material.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/app/theme/global_colors.dart';

class OnboardingDots extends StatelessWidget {
  const OnboardingDots({super.key, required this.count, required this.index});

  final int count;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < count; i++) ...[
          if (i > 0) gapW(6),
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: 7.h,
            width: i == index ? 22.w : 7.w,
            decoration: BoxDecoration(
              color: i == index
                  ? deemYellow
                  : deemYellow.withValues(alpha: 0.35),
              borderRadius: borderRadiusAll(20),
            ),
          ),
        ],
      ],
    );
  }
}
