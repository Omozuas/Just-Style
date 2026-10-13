import 'package:flutter/material.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:go_router/go_router.dart';
import 'package:juststyle/app/router/app_routes.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:juststyle/app/core/app_style.dart';
import 'package:juststyle/app/core/custom_tile.dart';
import 'package:juststyle/app/theme/global_colors.dart';

class SettingsProfile extends StatelessWidget {
  const SettingsProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => context.pop(),
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
                      () => context.push(AppRoutes.profilePassword),
                ),
                CustomTile2(
                  name: "Delete Account",
                  onTap: () {
                    showDeleteAccountDialog(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> showDeleteAccountDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: true,

      builder: (context) {
        return AlertDialog(
          backgroundColor: white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Center(
            child: Text(
              'Delete Account',
              textAlign: TextAlign.center,
              style: appStyle(18, black, FontWeight.bold),
            ),
          ),
          content: Text(
            'Are you sure you want to delete your account?\nOnce done, it can’t be reversed.',
            textAlign: TextAlign.center,
            style: appStyle(14, black, FontWeight.w400),
          ),
          actionsPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          actions: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Your delete logic here
                      Navigator.pop(context);
                      // You can also call another method after pop
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Proceed',
                      textAlign: TextAlign.center,
                      style: appStyle(14, white, FontWeight.w400),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Back',
                      textAlign: TextAlign.center,
                      style: appStyle(14, black, FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
