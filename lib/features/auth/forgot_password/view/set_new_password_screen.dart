import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/app/core/text/app_text.dart';
import 'package:juststyle/app/router/app_routes.dart';
import 'package:juststyle/app/theme/app_colors.dart';
import 'package:juststyle/shared/widgets/app_button.dart';
import 'package:juststyle/shared/widgets/app_text_field.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_onChanged);
    _confirmController.addListener(_onChanged);
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _onChanged() {
    if (!mounted) return;
    setState(() {});
    if (_confirmController.text.isNotEmpty) {
      _formKey.currentState?.validate();
    }
  }

  bool get _canReset {
    final password = _passwordController.text;
    return password.length >= 8 && password == _confirmController.text;
  }

  String? _password(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your password';
    if (value.length < 8) return 'Password must be at least 8 characters';
    return null;
  }

  String? _confirm(String? value) {
    if (value == null || value.isEmpty) return 'Please confirm your password';
    if (value != _passwordController.text) return 'Passwords do not match';
    return null;
  }

  void _reset() {
    if (!(_formKey.currentState?.validate() ?? false) || !_canReset) return;
    context.push(AppRoutes.passwordSuccess);
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
                Text(
                  'Set New Password',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.headingLarge(
                    textColor: AppColors.black2,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                gapH(8),
                Text(
                  'Create an extra layer of security by creating a unique password.',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.paragraphMedium(
                    textColor: AppColors.textSecondary,
                  ),
                ),
                gapH(50),
                AppTextField(
                  label: 'New Password',
                  hint: 'New Password',
                  controller: _passwordController,
                  isPassword: true,
                  textInputAction: TextInputAction.next,
                  validator: _password,
                ),
                gapH(20),
                AppTextField(
                  label: 'Confirm Password',
                  hint: 'Confirm Password',
                  controller: _confirmController,
                  isPassword: true,
                  textInputAction: TextInputAction.done,
                  validator: _confirm,
                ),
                gapH(35),
                AppButton(
                  text: 'Reset Password',
                  radius: 24,
                  height: 46,
                  vertical: 0,
                  variant:
                      _canReset
                          ? ButtonVariant.primary
                          : ButtonVariant.disabled,
                  onPressed: _canReset ? _reset : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
