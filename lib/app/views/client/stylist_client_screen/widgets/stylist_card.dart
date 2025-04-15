import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:juststyle/app/common/app_style.dart';
import 'package:juststyle/app/theme/global_colors.dart';

class StylistCard extends StatelessWidget {
  const StylistCard({
    super.key,
    required this.name,
    required this.image,
    required this.profession,
    required this.rating,
  });
  final String name, image, rating, profession;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 169,
              width: 168,
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
                    offset: Offset(3, 3), // Position of the shadow
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                width: 46.w,
                height: 22.h,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(4.r),
                    topStart: Radius.circular(4.r),
                    bottomEnd: Radius.circular(4.r),
                    bottomStart: Radius.circular(4.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 5.h,
                    left: 5.w,
                    bottom: 5.h,
                    right: 5.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RatingBarIndicator(
                        itemBuilder:
                            (context, index) =>
                                Icon(Icons.star, color: deemYellow),
                        rating: 1,
                        itemCount: 1,
                        itemSize: 15.sp,
                        itemPadding: EdgeInsets.zero,
                      ),
                      Text(rating, style: appStyle(10, black, FontWeight.w500)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Text(
          name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          softWrap: true,
          style: appStyle(15, black, FontWeight.w600),
        ),
        Text(
          profession,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          softWrap: true,
          style: appStyle(12, HexColor("#878787"), FontWeight.w400),
        ),
      ],
    );
  }
}
