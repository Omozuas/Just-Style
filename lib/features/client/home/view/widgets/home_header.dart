import 'package:flutter/cupertino.dart';
import 'package:juststyle/app/core/app_icon.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/app/core/text/app_text.dart';
import 'package:juststyle/app/theme/app_colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: SizedBox(
            width: 46.w,
            height: 46.w,
            child: Transform.scale(
              alignment: Alignment.topLeft,
              scale: 2,
              child: Image.asset(
                AppIcon.homeAvatar,
                width: 46.w,
                height: 46.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        gapW(10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back',
                style: AppTextStyle.paragraphSmall(textColor: AppColors.black2),
              ),
              Text(
                'Alex Samuel',
                style: AppTextStyle.headingXSmall(
                  textColor: AppColors.black2,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 28.ic,
          height: 28.ic,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(
                CupertinoIcons.bell,
                size: 26.ic,
                color: AppColors.black2,
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 8.w,
                  height: 8.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE53935),
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.white, width: 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
