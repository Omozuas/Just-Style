import 'package:flutter/material.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/features/client/home/view/widgets/popular_braid_grid.dart';

class DateTimeStylist extends StatelessWidget {
  const DateTimeStylist({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w),
        child: const PopularBraidGrid(count: 4),
      ),
    );
  }
}
