import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:juststyle/app/core/app_icon.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';

class VerifyCodeMark extends StatelessWidget {
  const VerifyCodeMark({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AppIcon.email, width: 122.w, height: 122.h);
  }
}
