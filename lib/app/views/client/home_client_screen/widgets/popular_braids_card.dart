import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:juststyle/app/common/app_style.dart';
import 'package:juststyle/app/theme/global_colors.dart';

class PopularBraidsCard extends StatelessWidget {
  const PopularBraidsCard({super.key, required this.name, required this.image});
  final String name, image;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 130.h,
          width: 168.w,
          decoration: BoxDecoration(
            color: black,
            borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(10.r),
              topStart: Radius.circular(10.r),
              bottomEnd: Radius.circular(10.r),
              bottomStart: Radius.circular(10.r),
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(image),
            ),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: black.withOpacity(0.5), // Shadow color
                blurRadius: 10, // Softness of the shadow
                spreadRadius: 1, // How much the shadow spreads
                offset: Offset(0, 5), // Position of the shadow
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Flexible(
          child: Text(
            name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            softWrap: true,
            style: appStyle(14, black, FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
