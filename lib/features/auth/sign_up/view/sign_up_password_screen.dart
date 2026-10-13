import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/app/router/app_routes.dart';
import 'package:juststyle/app/theme/app_colors.dart';
import 'package:juststyle/features/auth/sign_up/model/sign_up_profile.dart';
import 'package:juststyle/features/auth/sign_up/view/widgets/create_account_header.dart';
import 'package:juststyle/features/auth/sign_up/view/widgets/terms_agreement.dart';
import 'package:juststyle/shared/widgets/app_button.dart';
import 'package:juststyle/shared/widgets/app_dropdown.dart';
import 'package:juststyle/shared/widgets/app_text_field.dart';

class SignUpPasswordScreen extends StatefulWidget {
  const SignUpPasswordScreen({super.key, required this.profile});

  final SignUpProfile profile;

  @override
  State<SignUpPasswordScreen> createState() => _SignUpPasswordScreenState();
}

class _SignUpPasswordScreenState extends State<SignUpPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  String? _gender;
  bool _agreed = false;

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

  bool get _canSubmit {
    final password = _passwordController.text;
    final confirm = _confirmController.text;
    return _gender != null &&
        _agreed &&
        password.length >= 8 &&
        password == confirm;
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

  void _signUp() {
    if (!(_formKey.currentState?.validate() ?? false) || !_canSubmit) return;
    context.go(AppRoutes.verifyOtp, extra: widget.profile.email);
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CreateAccountHeader(),
                gapH(28),
                AppDropdown(
                  label: 'Gender',
                  hint: 'Select',
                  value: _gender,
                  items: const ['Female', 'Male'],
                  onChanged: (value) => setState(() => _gender = value),
                ),
                gapH(16),
                AppTextField(
                  label: 'Password',
                  hint: 'Password',
                  controller: _passwordController,
                  isPassword: true,
                  textInputAction: TextInputAction.next,
                  validator: _password,
                ),
                gapH(16),
                AppTextField(
                  label: 'Confirm Password',
                  hint: 'Confirm Password',
                  controller: _confirmController,
                  isPassword: true,
                  textInputAction: TextInputAction.done,
                  validator: _confirm,
                ),
                gapH(16),
                TermsAgreement(
                  value: _agreed,
                  onChanged: (value) => setState(() => _agreed = value),
                ),
                gapH(28),
                AppButton(
                  text: 'Sign Up',
                  radius: 24,
                  height: 46,
                  vertical: 0,
                  variant:
                      _canSubmit
                          ? ButtonVariant.primary
                          : ButtonVariant.disabled,
                  onPressed: _canSubmit ? _signUp : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
