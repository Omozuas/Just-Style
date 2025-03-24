import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:juststyle/app/common/app_style.dart';
import 'package:juststyle/app/common/button_large.dart';
import 'package:juststyle/app/theme/global_colors.dart';
import 'package:juststyle/app/views/auth_screen/login_screen.dart';
import 'package:lottie/lottie.dart';

class PasswordSuccessScreen extends StatelessWidget {
  const PasswordSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 15.h,
            left: 15.w,
            right: 15.w,
            bottom: 15.h,
          ),
          child: Column(
            children: [
              LottieBuilder.asset(
                "assets/animations/Animation - 1721409960375.json",
              ),
              SizedBox(height: 10.h),
              Text(
                'Password Changed',
                style: appStyle(28, black, FontWeight.w700),
              ),
              SizedBox(height: 20.h),
              Text(
                'Your password has been changed successfully',
                style: appStyle(15, black, FontWeight.w400),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
              SizedBox(height: 30.h),
              SizedBox(
                width: 166.w,
                child: ButtonLarge(
                  onTap: () {
                    Get.offAll(
                      () => LoginScreen(),
                      transition: Transition.cupertino,
                    );
                  },
                  text: 'Done',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
