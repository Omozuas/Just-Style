import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:juststyle/app/views/client/home_client_screen/widgets/popular_list_braids.dart';

class PhotosStylist extends StatelessWidget {
  const PhotosStylist({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w),
        child: PopularListBraids(),
      ),
    );
  }
}
