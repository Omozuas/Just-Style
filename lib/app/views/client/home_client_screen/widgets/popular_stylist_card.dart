import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:juststyle/app/common/app_style.dart';
import 'package:juststyle/app/theme/global_colors.dart';

class PopularStylistCard extends StatelessWidget {
  const PopularStylistCard({
    super.key,
    required this.image,
    required this.stylistName,
    required this.profession,
  });
  final String image, stylistName, profession;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 75.h,
            width: 75.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: black,
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            stylistName,
            textAlign: TextAlign.center,
            softWrap: true,
            style: appStyle(14, black, FontWeight.w500),
          ),
          Flexible(
            child: Text(
              profession,
              textAlign: TextAlign.center,
              maxLines: 2,
              softWrap: true,
              style: appStyle(12, HexColor("#878787"), FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
