import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:juststyle/app/common/app_style.dart';
import 'package:juststyle/app/common/button_large.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:juststyle/app/services/data/dummydata.dart';
import 'package:juststyle/app/theme/global_colors.dart';
import 'package:juststyle/app/views/auth_screen/login_screen.dart';
import 'package:juststyle/app/views/auth_screen/signup_screen.dart';

class LoginSignupWithScreen extends StatefulWidget {
  const LoginSignupWithScreen({super.key});

  @override
  State<LoginSignupWithScreen> createState() => _LoginSignupWithScreenState();
}

class _LoginSignupWithScreenState extends State<LoginSignupWithScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    _startImageSlider();
  }

  void _startImageSlider() {
    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      if (currentIndex < contents.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0; // Loop back to first image
      }
      _pageController.animateToPage(
        currentIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 15.w,
          top: 15.h,
          right: 15.w,
          bottom: 20.h,
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, i) {
                  final item = contents[i];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(item.image),
                      SizedBox(height: 20.h),
                      Text(
                        item.title,
                        textAlign: TextAlign.center,
                        style: appStyle(23, black, FontWeight.w600),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        item.discription,
                        textAlign: TextAlign.center,
                        style: appStyle(14, black, FontWeight.w400),
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) => buildDots(index, context)),
            ),
            SizedBox(height: 30.h),
            ButtonLarge(
              onTap: () {
                Get.offAll(
                  () => LoginScreen(),
                  transition: Transition.cupertino,
                );
              },
              text: 'Login',
            ),
            SizedBox(height: 20.h),
            ButtonLarge(
              isBorder: true,
              onTap: () {
                Get.offAll(
                  () => SignupScreen(),
                  transition: Transition.cupertino,
                );
              },
              text: 'Sign Up',
            ),
          ],
        ),
      ),
    );
  }

  Container buildDots(int index, BuildContext context) {
    return Container(
      height: 7.h,
      width: currentIndex == index ? 25.w : 10.w,
      margin: EdgeInsets.only(right: 5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: deemYellow,
      ),
    );
  }
}
