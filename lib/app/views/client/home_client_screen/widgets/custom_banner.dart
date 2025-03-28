// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:juststyle/app/common/app_style.dart';
import 'package:juststyle/app/theme/global_colors.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({
    super.key,
    required this.netWorkImg,
    required this.perctageoff,
    required this.onTap,
  });
  final String netWorkImg, perctageoff;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 138.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
          bottomLeft: Radius.circular(10.r),
          bottomRight: Radius.circular(10.r),
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(netWorkImg),
        ),
      ),
      child: Container(
        height: 138.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r),
            topRight: Radius.circular(10.r),
            bottomLeft: Radius.circular(10.r),
            bottomRight: Radius.circular(10.r),
          ),
          gradient: LinearGradient(
            begin: Alignment.center,
            stops: const [0.1, 0.9],
            colors: [black.withOpacity(.6), black.withOpacity(.6)],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Discover Amazing Braids",
                style: appStyle(16, white, FontWeight.w600),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text("Up to   ", style: appStyle(12, white, FontWeight.w400)),
                  Text(
                    perctageoff,
                    style: appStyle(19, white, FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  height: 24.h,
                  width: 64.w,

                  decoration: BoxDecoration(
                    color: deemYellow,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Text(
                      "Claim",
                      style: appStyle(11, white, FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
