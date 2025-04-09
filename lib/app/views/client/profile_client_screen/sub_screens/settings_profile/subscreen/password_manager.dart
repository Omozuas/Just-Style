import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:juststyle/app/common/app_style.dart';
import 'package:juststyle/app/common/button_large.dart';
import 'package:juststyle/app/common/custom_textfield.dart';
import 'package:juststyle/app/theme/global_colors.dart';

class PasswordManager extends StatefulWidget {
  const PasswordManager({super.key});

  @override
  State<PasswordManager> createState() => _PasswordManagerState();
}

class _PasswordManagerState extends State<PasswordManager> {
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
      // Get.offAll(() => VerfyOtpScreen(), arguments: {"email": info['email']});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(canPop: true, id: 3),
          child: Icon(Icons.arrow_back_ios_new, color: black),
        ),
        title: Text(
          "Password Manager",
          style: appStyle(21, HexColor("#1F1F1F"), FontWeight.w600),
        ),
        centerTitle: true,
        foregroundColor: white,
        backgroundColor: white,
        surfaceTintColor: white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 15.h,
              left: 15.w,
              right: 15.w,
              // bottom: 15.h,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "Please Note Changing Your PassWord Will Log You Out Of Your Account",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.h),
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
                    firstText: 'Confirm New Password',
                    hintText: "Confirm New Password",
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
                  ButtonLarge(onTap: proceed, text: 'Save'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
