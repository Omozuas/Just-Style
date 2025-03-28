import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:juststyle/app/theme/global_colors.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key, required this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36.w,
        height: 36.h,
        decoration: BoxDecoration(
          color: deemYellow,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.r),
            topRight: Radius.circular(5.r),
            bottomLeft: Radius.circular(5.r),
            bottomRight: Radius.circular(5.r),
          ),
        ),
        child: Icon(
          CupertinoIcons.line_horizontal_3_decrease,
          size: 26.sp,
          color: white,
        ),
      ),
    );
  }
}
