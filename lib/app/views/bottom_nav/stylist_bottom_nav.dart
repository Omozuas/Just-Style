// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:juststyle/app/common/app_style.dart';
import 'package:juststyle/app/controller/stylist_buttom_controller.dart';
import 'package:juststyle/app/theme/global_colors.dart';
import 'package:juststyle/app/views/stylist/client_stylist/client_stylist_screen.dart';
import 'package:juststyle/app/views/stylist/profile_stylist/profile_stylist_sxcreen.dart';
import 'package:juststyle/app/views/stylist/stylist_appoinment_screen/stylist_appointment_screen.dart';
import 'package:juststyle/app/views/stylist/stylist_home_screen/stylist_home_screen.dart';

class StylistBottomNavScreen extends StatelessWidget {
  StylistBottomNavScreen({super.key});

  final List<Widget> pages = [
    const StylistHomeScreen(),
    const StylistAppointmentScreen(),
    const ClientStylistScreen(),
    const ProfileStylistSxcreen(),
  ];
  final controller = Get.put(StylistButtomController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // ✅ Handle back button per tab
        final canPop =
            Get.nestedKey(controller.navIndex)?.currentState?.canPop() ?? false;
        if (canPop) {
          Get.nestedKey(controller.navsIndex)?.currentState?.pop();
          return false; // Prevents app from closing
        }
        return true; // Exits app if at root screen
      },
      child: Obx(
        () => Scaffold(
          body: IndexedStack(
            index: controller.navsIndex,
            children: [
              _buildNavigator(0, pages[0]),
              _buildNavigator(1, pages[1]),
              _buildNavigator(2, pages[2]),
              _buildNavigator(3, pages[3]),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.navsIndex,
            showSelectedLabels: true,
            selectedLabelStyle: appStyle(12, deemYellow, FontWeight.w600),
            unselectedLabelStyle: appStyle(12, lightGray, FontWeight.w600),
            showUnselectedLabels: true,
            selectedItemColor: deemYellow,
            unselectedItemColor: lightGray,
            selectedFontSize: 12.sp,
            unselectedFontSize: 12.sp,
            backgroundColor: white,
            unselectedIconTheme: IconThemeData(color: lightGray),
            selectedIconTheme: IconThemeData(color: deemYellow),
            onTap: (value) {
              controller.setNavIndex = value;
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icon/home.svg",
                  color: controller.navsIndex == 0 ? deemYellow : lightGray,
                ),

                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icon/book.svg",
                  color: controller.navsIndex == 1 ? deemYellow : lightGray,
                ),

                label: 'Appointment',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icon/fluent_people-28-regular.svg",
                  color: controller.navsIndex == 2 ? deemYellow : lightGray,
                ),

                label: 'Client',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icon/heroicons_user.svg",
                  color: controller.navsIndex == 3 ? deemYellow : lightGray,
                ),

                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ✅ Build Nested Navigator for each tab
  Widget _buildNavigator(int index, Widget child) {
    return Navigator(
      key: Get.nestedKey(index), // GetX Nested Navigation Key
      onGenerateRoute: (settings) {
        return GetPageRoute(settings: settings, page: () => child);
      },
    );
  }
}
