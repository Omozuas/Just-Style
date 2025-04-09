import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:juststyle/app/theme/global_colors.dart';
import 'package:juststyle/app/views/client/profile_client_screen/widgets/arc_painter.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Arc Painter
        CustomPaint(size: const Size(110, 110), painter: ArcPainter()),

        CircleAvatar(
          radius: 50,
          backgroundColor: HexColor("#EFB700"),
          backgroundImage: NetworkImage(image), // your image
        ),
        Positioned(
          bottom: 4,
          right: 4,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: HexColor("#32c000"),
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(6.sp),
              child: Icon(Icons.edit, size: 18.sp, color: white),
            ),
          ),
        ),
      ],
    );
  }
}
