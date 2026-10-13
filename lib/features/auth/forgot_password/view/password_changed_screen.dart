import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:juststyle/app/core/app_icon.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/app/core/text/app_text.dart';
import 'package:juststyle/app/router/app_routes.dart';
import 'package:juststyle/app/theme/app_colors.dart';
import 'package:juststyle/shared/widgets/app_button.dart';
import 'package:lottie/lottie.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: paddingSymmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              const Spacer(),
              Lottie.asset(AppIcon.passwordSuccess, height: 280.h),
              gapH(12),
              Text(
                'Password Changed',
                textAlign: TextAlign.center,
                style: AppTextStyle.headingLarge(
                  textColor: AppColors.black2,
                  fontWeight: FontWeight.w700,
                ),
              ),
              gapH(8),
              Text(
                'Your password has been changed successfully',
                textAlign: TextAlign.center,
                style: AppTextStyle.paragraphMedium(
                  textColor: AppColors.textSecondary,
                ),
              ),
              gapH(28),
              SizedBox(
                width: 160.w,
                child: AppButton(
                  text: 'Done',
                  radius: 24,
                  height: 46,
                  vertical: 0,
                  onPressed: () => context.go(AppRoutes.login),
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
