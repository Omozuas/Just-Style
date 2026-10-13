import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/app/core/text/app_text.dart';
import 'package:juststyle/app/theme/global_colors.dart';

class AppNavDestination {
  const AppNavDestination({required this.icon, required this.label});

  final String icon;
  final String label;
}

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.destinations,
    required this.onTap,
  });

  final int currentIndex;
  final List<AppNavDestination> destinations;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: white,
      elevation: 8,
      shadowColor: black.withValues(alpha: 0.08),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64.h,
          child: Row(
            children: [
              for (var i = 0; i < destinations.length; i++)
                Expanded(
                  child: InkWell(
                    onTap: () => onTap(i),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          destinations[i].icon,
                          width: 24.ic,
                          height: 24.ic,
                          colorFilter: ColorFilter.mode(
                            i == currentIndex ? deemYellow : lightGray,
                            BlendMode.srcIn,
                          ),
                        ),
                        gapH(4),
                        Text(
                          destinations[i].label,
                          style: AppTextStyle.labelSmall(
                            textColor: i == currentIndex ? deemYellow : lightGray,
                            strong: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
