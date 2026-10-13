import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/app/router/app_routes.dart';
import 'package:juststyle/app/theme/app_colors.dart';
import 'package:juststyle/features/auth/sign_up/model/sign_up_profile.dart';
import 'package:juststyle/features/auth/sign_up/view/widgets/create_account_header.dart';
import 'package:juststyle/shared/widgets/app_button.dart';
import 'package:juststyle/shared/widgets/app_text_field.dart';

class SignUpProfileScreen extends StatefulWidget {
  const SignUpProfileScreen({super.key});

  @override
  State<SignUpProfileScreen> createState() => _SignUpProfileScreenState();
}

class _SignUpProfileScreenState extends State<SignUpProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _stateController = TextEditingController();
  final _countryController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _stateController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  String? _required(String? value, String message) {
    if (value == null || value.trim().isEmpty) return message;
    return null;
  }

  String? _email(String? value) {
    final required = _required(value, 'Please enter your email');
    if (required != null) return required;
    final email = value!.trim();
    if (!email.contains('@') || !email.contains('.')) {
      return 'Enter a valid email address';
    }
    return null;
  }

  void _proceed() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    context.push(
      AppRoutes.signUpPassword,
      extra: SignUpProfile(
        username: _usernameController.text.trim(),
        email: _emailController.text.trim(),
        address: _addressController.text.trim(),
        state: _stateController.text.trim(),
        country: _countryController.text.trim(),
      ),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CreateAccountHeader(),
                gapH(28),
                AppTextField(
                  label: 'Username',
                  hint: 'User name',
                  controller: _usernameController,
                  textInputAction: TextInputAction.next,
                  validator:
                      (value) => _required(value, 'Please enter your username'),
                ),
                gapH(16),
                AppTextField(
                  label: 'Email',
                  hint: 'Email Address',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: _email,
                ),
                gapH(16),
                AppTextField(
                  label: 'Address',
                  hint: 'Address',
                  controller: _addressController,
                  textInputAction: TextInputAction.next,
                  validator:
                      (value) => _required(value, 'Please enter your address'),
                ),
                gapH(16),
                AppTextField(
                  label: 'State',
                  hint: 'State',
                  controller: _stateController,
                  textInputAction: TextInputAction.next,
                  validator:
                      (value) => _required(value, 'Please enter your state'),
                ),
                gapH(16),
                AppTextField(
                  label: 'Country',
                  hint: 'Country',
                  controller: _countryController,
                  textInputAction: TextInputAction.done,
                  validator:
                      (value) => _required(value, 'Please enter your country'),
                ),
                gapH(32),
                AppButton(
                  text: 'Proceed',
                  radius: 24,
                  height: 46,
                  vertical: 0,
                  onPressed: _proceed,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
