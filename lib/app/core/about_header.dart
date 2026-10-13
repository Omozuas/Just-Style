import 'package:flutter/material.dart';
import 'package:juststyle/app/core/app_style.dart';
import 'package:juststyle/app/theme/global_colors.dart';

class AboutHeader extends StatelessWidget {
  const AboutHeader({
    super.key,
    this.showSeeAll = false,
    required this.text,
    this.onTap,
  });
  final bool showSeeAll;
  final Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: appStyle(18, black, FontWeight.w500)),
        if (showSeeAll)
          GestureDetector(
            onTap: onTap,
            child: Text("See All", style: appStyle(13, black, FontWeight.w400)),
          ),
      ],
    );
  }
}
