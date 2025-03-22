import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:juststyle/app/common/button_large.dart';
import 'package:juststyle/app/theme/app_sizes.dart';
import 'package:juststyle/app/views/welcome_screen/login_signup_with_screen.dart';

class WelcomScreen extends StatefulWidget {
  const WelcomScreen({super.key});

  @override
  State<WelcomScreen> createState() => _WelcomScreenState();
}

class _WelcomScreenState extends State<WelcomScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  late Timer _timer;
  List<String> images = [
    "assets/image/afro-american-woman-model-studio.jpg",
    "assets/image/medium-shot-smiley-woman-posing.jpg",
    "assets/image/mostafa-meraji-z2qyry-n-PA-unsplash.jpg",
    "assets/image/pexels-cottonbro-3993453.jpg",
    "assets/image/pexels-jibarofoto-1453005.jpg",
    "assets/image/pexels-thgusstavo-2775269.jpg",
  ];

  @override
  void initState() {
    super.initState();
    _startImageSlider();
  }

  void _startImageSlider() {
    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      if (_currentIndex < images.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0; // Loop back to first image
      }
      _pageController.animateToPage(
        _currentIndex,
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
      body: Stack(
        children: [
          PageView.builder(
            itemCount: images.length,
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                width: width.w,
                height: height.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(images[index]),
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 1,
            right: 5,
            left: 5,
            child: Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 20.h),
              child: Column(
                children: [
                  ButtonLarge(
                    onTap: () {
                      Get.offAll(
                        () => LoginSignupWithScreen(),
                        transition: Transition.cupertino,
                      );
                    },
                    text: 'As Client',
                  ),
                  SizedBox(height: 20.h),
                  ButtonLarge(
                    onTap: () {
                      Get.offAll(
                        () => LoginSignupWithScreen(),
                        transition: Transition.cupertino,
                      );
                    },
                    text: 'As Stylist',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
