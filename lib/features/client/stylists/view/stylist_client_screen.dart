import 'package:flutter/material.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/app/core/app_style.dart';
import 'package:juststyle/app/core/custom_search_field.dart';
import 'package:juststyle/app/core/search_button.dart';
import 'package:juststyle/app/theme/global_colors.dart';
import 'package:juststyle/features/client/stylists/view/widgets/list_of_stylist.dart';

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
          padding: EdgeInsets.only(top: 15.h, left: 15.w, right: 15.w),
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
              SizedBox(height: 5.h),
              Expanded(child: ListOfStylist()),
            ],
          ),
        ),
      ),
    );
  }
}
