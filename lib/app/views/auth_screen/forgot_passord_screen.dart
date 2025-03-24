import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:juststyle/app/common/app_style.dart';
import 'package:juststyle/app/common/button_large.dart';
import 'package:juststyle/app/common/custom_textfield.dart';
import 'package:juststyle/app/theme/global_colors.dart';
import 'package:juststyle/app/views/auth_screen/verify_phone_number_otp_screen.dart';

class ForgotPassordScreen extends StatefulWidget {
  const ForgotPassordScreen({super.key});

  @override
  State<ForgotPassordScreen> createState() => _ForgotPassordScreenState();
}

class _ForgotPassordScreenState extends State<ForgotPassordScreen> {
  TextEditingController numberCotroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void proceed() {
    if (_formKey.currentState?.validate() ?? false) {
      Get.offAll(
        () => VerifyPhoneNumberOtpScreen(),
        arguments: {"number": numberCotroller.text},
      );
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
          child: Icon(Icons.arrow_back, color: black, size: 25.sp),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                  SizedBox(height: 50.h),
                  SvgPicture.asset("assets/icon/ep_lock.svg"),
                  SizedBox(height: 40.h),
                  Text(
                    "Forgot Password",
                    textAlign: TextAlign.center,
                    style: appStyle(32, black, FontWeight.w700),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    textAlign: TextAlign.center,
                    "Enter your phone number",
                    style: appStyle(15, black, FontWeight.w400),
                  ),

                  SizedBox(height: 50.h),
                  CustomTextFields(
                    firstText: "Phone number",
                    hintText: "Phone number",
                    controller: numberCotroller,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Phone number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 50.h),
                  ButtonLarge(onTap: proceed, text: 'Proceed'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
