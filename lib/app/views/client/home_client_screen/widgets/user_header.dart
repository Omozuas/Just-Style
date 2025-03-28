import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:juststyle/app/common/app_style.dart';
import 'package:juststyle/app/theme/global_colors.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 45.h,
              width: 45.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: black,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://s3-alpha-sig.figma.com/img/e6cb/f244/869b5c76396f2924f52f99387955049b?Expires=1743984000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=SOUC2D5NEMSh8zOQxynNgWegZ-CpP9VVX4hPAsQ4xf4juBSruLmmuG8eh2B4chRYCmDUDS7DtzXemT62yy0DAwcgyknSxTjD7WRSF6B8N689fp3CIsd0IW~q~7vWzJgC9VYrMk2JAQX-264---2xDmt-SE8WbzC-7Oga3xcaYnE~zFdDW7p1xt56R0rbK7u6yEkJZfGStL~GXAu3EN6lDppiPw2GsrF3UgmcACfmQIi4GuVxDsYwccY4rg3ozC2eGeS1vpymokPeizTN5a82-niD8gHffto~3cTcRia2kmfl68kuiFbGYJCUfTv-bhUJrAYbhXtI-H2z5H5BkyUAHA__",
                  ),
                ),
              ),
            ),
            SizedBox(width: 5.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back",
                  style: appStyle(11, black, FontWeight.w400),
                ),
                SizedBox(height: 3.h),
                Text(
                  "Alex Samuel",
                  style: appStyle(17, black, FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
        Stack(
          children: [
            SizedBox(
              width: 30.w,
              height: 30.h,
              child: Icon(CupertinoIcons.bell, size: 30.sp, color: black),
            ),
            Positioned(
              right: 1,
              child: Container(
                width: 12.w,
                height: 12.h,
                decoration: BoxDecoration(
                  border: Border.all(color: white, width: 1.w),
                  color: red,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
