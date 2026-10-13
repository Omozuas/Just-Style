import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:juststyle/app/core/app_icon.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/app/core/text/app_text.dart';
import 'package:juststyle/app/router/app_routes.dart';
import 'package:juststyle/app/theme/app_colors.dart';
import 'package:juststyle/shared/widgets/app_button.dart';
import 'package:juststyle/shared/widgets/app_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  bool get _emailValid {
    final email = _emailController.text.trim();
    return email.contains('@') && email.contains('.');
  }

  String? _email(String? value) {
    if (value == null || value.trim().isEmpty) return 'Please enter your email';
    if (!value.trim().contains('@') || !value.trim().contains('.')) {
      return 'Enter a valid email address';
    }
    return null;
  }

  void _proceed() {
    if (!(_formKey.currentState?.validate() ?? false) || !_emailValid) return;
    context.push(
      AppRoutes.verifyResetCode,
      extra: _emailController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: paddingSymmetric(horizontal: 16, vertical: 24),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                gapH(36),
                SvgPicture.asset(AppIcon.lock, width: 96.w, height: 99.h),
                gapH(28),
                Text(
                  'Forgot Password',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.headingLarge(
                    textColor: AppColors.black2,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                gapH(8),
                Text(
                  'Enter your email',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.paragraphMedium(
                    textColor: AppColors.textSecondary,
                  ),
                ),
                gapH(36),
                AppTextField(
                  label: 'Email',
                  hint: 'Email Address',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  validator: _email,
                ),
                gapH(28),
                AppButton(
                  text: 'Proceed',
                  radius: 24,
                  height: 46,
                  vertical: 0,
                  variant:
                      _emailValid
                          ? ButtonVariant.primary
                          : ButtonVariant.disabled,
                  onPressed: _emailValid ? _proceed : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
