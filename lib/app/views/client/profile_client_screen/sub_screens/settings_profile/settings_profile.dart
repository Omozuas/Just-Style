import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:juststyle/app/common/app_style.dart';
import 'package:juststyle/app/common/custom_tile.dart';
import 'package:juststyle/app/theme/global_colors.dart';
import 'package:juststyle/app/views/client/profile_client_screen/sub_screens/settings_profile/subscreen/password_manager.dart';

class SettingsProfile extends StatelessWidget {
  const SettingsProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(canPop: true, id: 3),
          child: Icon(Icons.arrow_back_ios_new, color: black),
        ),
        title: Text(
          "Settings",
          style: appStyle(21, HexColor("#1F1F1F"), FontWeight.w600),
        ),
        centerTitle: true,
        foregroundColor: white,
        backgroundColor: white,
        surfaceTintColor: white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 15.h,
              left: 15.w,
              right: 15.w,
              // bottom: 15.h,
            ),
            child: Column(
              children: [
                CustomTile2(name: "Notifications", onTap: () {}),
                CustomTile2(
                  name: "Password Manager",
                  onTap:
                      () => Get.to(
                        () => PasswordManager(),
                        id: 3,
                        transition: Transition.cupertino,
                      ),
                ),
                CustomTile2(name: "Delete Account", onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
