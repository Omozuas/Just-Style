// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:juststyle/app/common/app_style.dart';
import 'package:juststyle/app/controller/client_bottom_nav_controller.dart';
import 'package:juststyle/app/theme/global_colors.dart';
import 'package:juststyle/app/views/client/booking_client_screen/booking_client_screen.dart';
import 'package:juststyle/app/views/client/home_client_screen/home_client_screen.dart';
import 'package:juststyle/app/views/client/profile_client_screen/profile_client_screen.dart';
import 'package:juststyle/app/views/client/stylist_client_screen/stylist_client_screen.dart';

class ClientBottomNavigationScreen extends StatelessWidget {
  ClientBottomNavigationScreen({super.key});
  final List<Widget> pages = [
    const HomeClientScreen(),
    const BookingClientScreen(),
    const StylistClientScreen(),
    const ProfileClientScreen(),
  ];
  final controller = Get.put(ClientBottomNavController());
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

                label: 'Bookings',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icon/icon-park-outline_comb.svg",
                  color: controller.navsIndex == 2 ? deemYellow : lightGray,
                ),

                label: 'Stylist',
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
