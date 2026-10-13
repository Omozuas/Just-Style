import 'package:flutter/material.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/app/core/app_style.dart';
import 'package:juststyle/app/theme/app_sizes.dart';
import 'package:juststyle/app/theme/global_colors.dart';

class ButtonLarge extends StatelessWidget {
  const ButtonLarge({
    super.key,
    required this.onTap,
    required this.text,
    this.isLoading = false,
    this.isBorder = false,
  });
  final void Function()? onTap;
  final String text;
  final bool isLoading, isBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? () {} : onTap,
      child: Container(
        width: width.w,
        height: 46.h,
        decoration: BoxDecoration(
          color:
              isLoading
                  ? white
                  : isBorder
                  ? white
                  : black,
          borderRadius: BorderRadius.circular(20.r),
          border:
              isBorder
                  ? Border.all(color: black, width: 1.5.w)
                  : Border(
                    top: BorderSide.none,
                    bottom: BorderSide.none,
                    left: BorderSide.none,
                    right: BorderSide.none,
                  ),
        ),
        child: Center(
          child:
              isLoading
                  ? CircularProgressIndicator(color: black)
                  : Text(
                    text,
                    style:
                        isBorder
                            ? appStyle(16, black, FontWeight.w600)
                            : appStyle(16, white, FontWeight.w600),
                  ),
        ),
      ),
    );
  }
}
