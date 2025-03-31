import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:juststyle/app/common/app_style.dart';
import 'package:juststyle/app/common/custom_search_field.dart';
import 'package:juststyle/app/common/search_button.dart';
import 'package:juststyle/app/theme/global_colors.dart';
import 'package:juststyle/app/views/client/stylist_client_screen/widgets/list_of_stylist.dart';

class StylistClientScreen extends StatelessWidget {
  const StylistClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stylist", style: appStyle(21, black, FontWeight.w600)),
        centerTitle: true,
        foregroundColor: white,
        backgroundColor: white,
        surfaceTintColor: white,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 15.h,
            left: 15.w,
            bottom: 15.h,
            right: 15.w,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: CustomSearchField(onChanged: (p0) {})),
                  SizedBox(width: 13.w),
                  SearchButton(onTap: () {}),
                ],
              ),
              SizedBox(height: 15.h),
              Expanded(child: ListOfStylist()),
            ],
          ),
        ),
      ),
    );
  }
}
