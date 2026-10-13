import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/app/core/text/app_text.dart';
import 'package:juststyle/app/router/app_routes.dart';
import 'package:juststyle/app/theme/app_colors.dart';
import 'package:juststyle/core/locator/service_locator.dart';
import 'package:juststyle/app/theme/global_colors.dart';
import 'package:juststyle/shared/widgets/app_button.dart';
import 'package:juststyle/shared/widgets/app_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: paddingSymmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              Text(
                'Log In',
                textAlign: TextAlign.center,
                style: AppTextStyle.headingLarge(
                  textColor: AppColors.black2,
                  fontWeight: FontWeight.w700,
                ),
              ),
              gapH(8),
              Text(
                'Kindly enter your login details to continue',
                textAlign: TextAlign.center,
                style: AppTextStyle.paragraphMedium(
                  textColor: AppColors.textSecondary,
                ),
              ),
              gapH(28),
              const AppTextField(
                label: 'Email',
                hint: 'Email Address',
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              gapH(16),
              const AppTextField(
                label: 'Password',
                hint: 'Password',
                isPassword: true,
                textInputAction: TextInputAction.done,
              ),
              gapH(8),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => context.push(AppRoutes.forgotPassword),
                  child: Text(
                    'Forgot Password ?',
                    style: AppTextStyle.paragraphMedium(textColor: blue),
                  ),
                ),
              ),
              gapH(28),
              AppButton(
                text: 'Login',
                radius: 24,
                height: 46,
                vertical: 0,
                onPressed: () => context.go(appSession.homePath),
              ),
              gapH(16),
              Text.rich(
                TextSpan(
                  style: AppTextStyle.paragraphMedium(
                    textColor: AppColors.black2,
                  ),
                  children: [
                    const TextSpan(text: 'Don’t have an account? '),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.baseline,
                      baseline: TextBaseline.alphabetic,
                      child: GestureDetector(
                        onTap: () => context.go(AppRoutes.signUp),
                        child: Text(
                          'Sign Up',
                          style: AppTextStyle.paragraphMedium(
                            textColor: blue,
                            strong: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
