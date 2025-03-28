import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:juststyle/app/common/app_style.dart';
import 'package:juststyle/app/common/custom_search_field.dart';
import 'package:juststyle/app/common/search_button.dart';
import 'package:juststyle/app/theme/global_colors.dart';
import 'package:juststyle/app/views/client/home_client_screen/widgets/custom_banner.dart';
import 'package:juststyle/app/views/client/home_client_screen/widgets/user_header.dart';

class HomeClientScreen extends StatelessWidget {
  const HomeClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 15.h,
              left: 15.w,
              bottom: 15.h,
              right: 15.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserHeader(),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: CustomSearchField(onChanged: (p0) {})),
                    SizedBox(width: 13.w),
                    SearchButton(onTap: () {}),
                  ],
                ),
                SizedBox(height: 25.h),
                Text(
                  "Special Offer",
                  textAlign: TextAlign.left,
                  style: appStyle(18, black, FontWeight.w500),
                ),
                SizedBox(height: 10.h),
                CustomBanner(
                  perctageoff: "30%",
                  onTap: () {},
                  netWorkImg:
                      "https://s3-alpha-sig.figma.com/img/ffd2/fc76/d9be967c39f556d9d4d0869c8cfc3c1b?Expires=1743984000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=n12BTvnIifMlnLt0V43YCZuaUN93mMmhtp15khbBIxlsho5QrVJ3dHHz5YZ9u44czlNO2A5y8U0ZGL~purtItgDSTQGifgMpk5mlfcdqlyNOZWd4CRmEG~6FGrDTjfRiF2u9hQwNnDEttA9uhkESHedHx9nKoLVa-wIpCIrEZwUlcM9dY~ij9PPkblzM1XIdJXcv79WN1UXKBf4It2UZKXNY~DZDc4kxoz4cEJWxpwv2I-14PZzmmIOAhuZyFIX-fe7Uyc91DCk7dDNlhxLdrzFqamncbxiGGzy95UclP~ZfRsWC-aO1Rxv6Ypdp4TYCrUaVr2pdZtrtaUcjqp80WA__",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
