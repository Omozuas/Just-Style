import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/app/core/app_style.dart';
import 'package:juststyle/app/theme/global_colors.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key, required this.onChanged});
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: Icon(CupertinoIcons.search),
        ),
        suffixIconColor: deemYellow,
        hintText: "Search here...",
        focusColor: black,
        contentPadding: EdgeInsets.only(left: 20.w, right: 20.w),
        hintStyle: appStyle(14, lightGray, FontWeight.w500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r),
            topRight: Radius.circular(10.r),
            bottomLeft: Radius.circular(10.r),
            bottomRight: Radius.circular(10.r),
          ),
          borderSide: BorderSide(width: 1, color: lightGray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r),
            topRight: Radius.circular(10.r),
            bottomLeft: Radius.circular(10.r),
            bottomRight: Radius.circular(10.r),
          ),
          borderSide: BorderSide(width: 1, color: black),
        ),
      ),

      onChanged: onChanged,
    );
  }
}
