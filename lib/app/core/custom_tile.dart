import 'package:flutter/material.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:juststyle/app/core/app_style.dart';
import 'package:juststyle/app/theme/global_colors.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({
    super.key,
    required this.icon,
    required this.name,
    this.onTap,
  });
  final String icon, name;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 17.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: HexColor("#DBDBDB")),
        ),
      ),
      child: ListTile(
        title: Text(name, style: appStyle(16, black, FontWeight.w400)),
        leading: SvgPicture.asset(icon),
        trailing: Icon(Icons.arrow_forward_ios_sharp, color: deemYellow),
        onTap: onTap,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}

class CustomTile2 extends StatelessWidget {
  const CustomTile2({super.key, required this.name, this.onTap});
  final String name;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 17.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: HexColor("#DBDBDB")),
        ),
      ),
      child: ListTile(
        title: Text(name, style: appStyle(16, black, FontWeight.w400)),

        trailing: Icon(Icons.arrow_forward_ios_sharp, color: deemYellow),
        onTap: onTap,
        // contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
