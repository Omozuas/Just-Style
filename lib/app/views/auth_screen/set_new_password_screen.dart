import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:juststyle/app/common/app_style.dart';
import 'package:juststyle/app/common/button_large.dart';
import 'package:juststyle/app/common/custom_textfield.dart';
import 'package:juststyle/app/theme/global_colors.dart';
import 'package:juststyle/app/views/success_screen/password_success_screen.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  final TextEditingController passswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool _isPasswordObscured = true;
  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordObscured = !_isPasswordObscured;
    });
  }

  bool _isPasswordObscured2 = true;
  void _togglePasswordVisibility2() {
    setState(() {
      _isPasswordObscured2 = !_isPasswordObscured2;
    });
  }

  final _formKey = GlobalKey<FormState>();
  void proceed() {
    if (_formKey.currentState?.validate() ?? false) {
      Get.offAll(
        () => PasswordSuccessScreen(),
        transition: Transition.cupertino,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 15.h,
              left: 15.w,
              right: 15.w,
              bottom: 15.h,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 40.h),
                  Text(
                    'Set New Password',
                    style: appStyle(28, black, FontWeight.w700),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Create an extra layer of security by creating a unique password.',
                    style: appStyle(15, black, FontWeight.w400),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                  SizedBox(height: 40.h),
                  CustomTextFields(
                    firstText: 'New Password',
                    hintText: "New Password",
                    controller: passswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your New Password';
                      }
                      return null;
                    },
                    obscureText: _isPasswordObscured,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordObscured
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: _isPasswordObscured ? lightGray : black,
                      ),
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFields(
                    firstText: 'Confirm Password',
                    hintText: "Confirm Password",
                    controller: confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Confirm Password';
                      }
                      if (value != passswordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    obscureText: _isPasswordObscured2,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordObscured2
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: _isPasswordObscured2 ? lightGray : black,
                      ),
                      onPressed: _togglePasswordVisibility2,
                    ),
                  ),

                  SizedBox(height: 40.h),
                  ButtonLarge(onTap: proceed, text: 'Reset Password'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
