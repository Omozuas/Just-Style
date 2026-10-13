import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:juststyle/app/core/app_icon.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:juststyle/app/core/app_style.dart';
import 'package:juststyle/app/theme/global_colors.dart';

class ProfileHeaderSection extends StatelessWidget {
  const ProfileHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 224.h,
              margin: EdgeInsets.only(bottom: 75.h),
              width: MediaQuery.of(context).size.width.w,
              decoration: BoxDecoration(
                color: black,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://s3-alpha-sig.figma.com/img/c913/7243/96bd5eef5f2997599ca27b5859a73ccb?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=MuEP4Gz-cy25ULg7f4gUgbeMSGF8AEEc5R5~6vjlVcdMu977VcHY2u9lumC8itHCgYPvHMYyjtXqGQtaBL9C-hWcfgBr8ujJej~brwNweYs-QH6FY2S0y4IrAAoOM2zIvWBGbiM66HDdhLSKNrzSqFDl5KfddhpSjn9JO0MoibsgdOd5vL-AIPce33ENt7nJtWYd5qrJzVuNLM9edurg3164gNW~R1AFVPEfn-M5zto-aRy4jCpNBCrIw4m~~S4q5N8M2eprcyxcjExdDAFvSDxU0HTXkGR7~4VA~RAhPOGa4i~Lg9ifYqtOPnMHQ~xrkhcQE6TI5JRm4LUU4VXt-g__',
                  ),
                ),
              ),
              child: SafeArea(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.w, right: 15.w),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => context.pop(),
                          child: Icon(Icons.arrow_back_ios_new, color: white),
                        ),
                        Expanded(
                          child: Text(
                            "Stylist",
                            textAlign: TextAlign.center,
                            style: appStyle(21, white, FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 125,

              child: Container(
                height: 135.h,
                width: 135.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: black,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "https://s3-alpha-sig.figma.com/img/cd0c/e7e0/e01ba57de3f42f95a0e9d476dde27ab9?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=dDcChslh-Mi6jImag0-jmHv47rNNwsupxTDSS6Pr7asj-UccznvEflC2RYrgQTbq96FqsBFx3ugzplsxQKgz9Ry2yyExUz4FKE~M9nsHXT8ywNVVVsHG2055FNmtShTMXPO4Kl0GP54T1Dagljcmfpl0wuFGN5hklKEShckRWAXJV0X2ykvdjDYVFo8sPy1Hizpvsm9QSONa1za4yBAp6HGLPmtThDuaHvVW~ktRJoNItneJmWL2UgPFj~7gN212XdOb7YD54rb3cYYRhbyoUnybyZHb0hHB50jNMqhSJaLE2~ZgdlAxheC7V7KaNmPVd3lomCM3G2W16s8VQAab9w__",
                    ),
                  ),
                  border: Border.all(width: 6, color: white),
                ),
              ),
            ),

            Positioned(
              bottom: 30,
              right: 15,
              child: Container(
                height: 31.h,
                width: 76.w,
                decoration: BoxDecoration(
                  color: HexColor("#D0FFE0"),
                  borderRadius: BorderRadius.all(Radius.circular(15.r)),
                ),
                child: Center(
                  child: Text(
                    "Open",
                    textAlign: TextAlign.center,
                    style: appStyle(13, green, FontWeight.w600),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 15,

              child: SizedBox(
                height: 31.h,
                width: 76.w,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      RatingBarIndicator(
                        itemBuilder:
                            (context, index) =>
                                Icon(Icons.star, color: deemYellow),
                        rating: 1,
                        itemCount: 1,
                        itemSize: 25.sp,
                        itemPadding: EdgeInsets.zero,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        "(5.0)",
                        textAlign: TextAlign.center,
                        style: appStyle(15, black, FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 5.h),
        Text(
          "Grace A",
          textAlign: TextAlign.center,
          style: appStyle(20, black, FontWeight.w500),
        ),
        SizedBox(height: 5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppIcon.location),
            Text(
              "23, Osborne ikoyi lagos State",
              textAlign: TextAlign.center,
              style: appStyle(12, black, FontWeight.w400),
            ),
          ],
        ),
      ],
    );
  }
}
