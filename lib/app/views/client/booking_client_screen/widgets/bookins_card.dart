import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:juststyle/app/common/app_style.dart';
import 'package:juststyle/app/theme/global_colors.dart';

class BookinsCard extends StatelessWidget {
  const BookinsCard({
    super.key,
    required this.nameOfHair,
    required this.date,
    required this.time,
    required this.amount,
    required this.image,
    required this.rating,
  });
  final String nameOfHair, date, time, amount, image, rating;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Container(
        height: 67.h,
        padding: EdgeInsets.only(bottom: 4.h),
        width: MediaQuery.of(context).size.width,

        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: HexColor("#DBDBDB")),
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 55.h,
              width: 63.w,

              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  topEnd: Radius.circular(10.r),
                  topStart: Radius.circular(10.r),
                  bottomEnd: Radius.circular(10.r),
                  bottomStart: Radius.circular(10.r),
                ),
                image: DecorationImage(image: NetworkImage(image)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(6.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          nameOfHair,
                          style: appStyle(16, black, FontWeight.w500),
                        ),
                        Row(
                          children: [
                            Text(
                              time,
                              style: appStyle(12, black, FontWeight.w400),
                            ),
                            SizedBox(width: 6.w),
                            RatingBarIndicator(
                              itemBuilder:
                                  (context, index) =>
                                      Icon(Icons.star, color: deemYellow),
                              rating: 1,
                              itemCount: 1,
                              itemSize: 15.sp,
                              itemPadding: EdgeInsets.zero,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              rating,
                              style: appStyle(11, black, FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(date, style: appStyle(12, black, FontWeight.w400)),
                        Text(
                          amount,
                          style: appStyle(16, black, FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
