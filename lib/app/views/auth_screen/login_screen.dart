import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:juststyle/app/common/app_style.dart';
import 'package:juststyle/app/common/button_large.dart';
import 'package:juststyle/app/common/custom_textfield.dart';
import 'package:juststyle/app/theme/global_colors.dart';
import 'package:juststyle/app/views/auth_screen/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordObscured = true;
  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordObscured = !_isPasswordObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            child: Padding(
              padding: EdgeInsets.only(
                top: 15.h,
                left: 15.w,
                right: 15.w,
                bottom: 15.h,
              ),
              child: Column(
                children: [
                  Text(
                    "Log In",
                    textAlign: TextAlign.center,
                    style: appStyle(32, black, FontWeight.w700),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Kindly enter your login details to continue",
                    textAlign: TextAlign.center,
                    style: appStyle(15, black, FontWeight.w400),
                  ),
                  SizedBox(height: 30.h),
                  CustomTextFields(
                    firstText: 'Email',
                    hintText: "Email Address",
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30.h),
                  CustomTextFields(
                    firstText: 'Password',
                    hintText: "Password",
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Password';
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
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Forgot Password ?',
                          textAlign: TextAlign.end,
                          style: appStyle(14, blue, FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50.h),
                  ButtonLarge(onTap: () {}, text: 'Login'),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account?',
                        textAlign: TextAlign.center,
                        style: appStyle(14, black, FontWeight.w400),
                      ),
                      SizedBox(width: 7.w),
                      GestureDetector(
                        onTap: () {
                          Get.offAll(() => SignupScreen());
                        },
                        child: Text(
                          'Sign Up',
                          textAlign: TextAlign.center,
                          style: appStyle(14, blue, FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
