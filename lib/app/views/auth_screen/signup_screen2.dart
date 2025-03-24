import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:juststyle/app/common/app_style.dart';
import 'package:juststyle/app/common/button_large.dart';
import 'package:juststyle/app/common/custom_textfield.dart';
import 'package:juststyle/app/theme/global_colors.dart';
import 'package:juststyle/app/views/auth_screen/login_screen.dart';
import 'package:juststyle/app/views/auth_screen/verfy_otp_screen.dart';

class SignupScreen2 extends StatefulWidget {
  const SignupScreen2({super.key});

  @override
  State<SignupScreen2> createState() => _SignupScreen2State();
}

class _SignupScreen2State extends State<SignupScreen2> {
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

  String? dropdown = 'Select Gender';
  final _formKey = GlobalKey<FormState>();
  void proceed() {
    final info = Get.arguments;
    if (_formKey.currentState?.validate() ?? false) {
      Get.offAll(() => VerfyOtpScreen(), arguments: {"email": info['email']});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: white,
        backgroundColor: white,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back, color: black),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
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
                    "Create Account",
                    textAlign: TextAlign.center,
                    style: appStyle(32, black, FontWeight.w700),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Kindly enter your  details to continue",
                    textAlign: TextAlign.center,
                    style: appStyle(15, black, FontWeight.w400),
                  ),
                  SizedBox(height: 30.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gender",
                        style: appStyle(15, black, FontWeight.w400),
                      ),
                      SizedBox(height: 5.h),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(
                          left: 10.w,
                          right: 10.w,
                          top: 5.h,
                          bottom: 5.h,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: lightGray),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            borderRadius: BorderRadius.circular(10.r),
                            icon: Icon(Icons.keyboard_arrow_down),
                            iconSize: 25.sp,
                            elevation: 0,
                            style: appStyle(15, black, FontWeight.w400),
                            padding: EdgeInsets.zero,
                            isExpanded: false,
                            focusColor: black,
                            dropdownColor: white,
                            onChanged: (String? nwvalue) {
                              setState(() {
                                dropdown = nwvalue;
                                log(nwvalue ?? '');
                              });
                            },
                            value: dropdown,
                            items: [
                              DropdownMenuItem<String>(
                                value: 'Select Gender',
                                child: Text(
                                  'Select Gender',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              DropdownMenuItem<String>(
                                value: 'Female',
                                child: Text(
                                  'Female',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              DropdownMenuItem<String>(
                                value: 'Male',
                                child: Text(
                                  'Male',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),
                  CustomTextFields(
                    firstText: 'Password',
                    hintText: "Password",
                    controller: passswordController,
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

                  SizedBox(height: 35.h),
                  ButtonLarge(onTap: proceed, text: 'signup'),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        textAlign: TextAlign.center,
                        style: appStyle(14, black, FontWeight.w400),
                      ),
                      SizedBox(width: 7.w),
                      GestureDetector(
                        onTap: () {
                          Get.offAll(() => LoginScreen());
                        },
                        child: Text(
                          'Login',
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
