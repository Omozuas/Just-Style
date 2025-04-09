import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:juststyle/app/common/app_style.dart';
import 'package:juststyle/app/common/custom_tile.dart';
import 'package:juststyle/app/theme/global_colors.dart';
import 'package:juststyle/app/views/client/profile_client_screen/sub_screens/account_info_screen.dart';
import 'package:juststyle/app/views/client/profile_client_screen/sub_screens/all_bookings_profile.dart';
import 'package:juststyle/app/views/client/profile_client_screen/sub_screens/settings_profile/settings_profile.dart';
import 'package:juststyle/app/views/client/profile_client_screen/widgets/profile_picture.dart';

class ProfileClientScreen extends StatelessWidget {
  const ProfileClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: appStyle(21, black, FontWeight.w600)),
        centerTitle: true,
        foregroundColor: white,
        backgroundColor: white,
        surfaceTintColor: white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 15.h, left: 15.w, right: 15.w),
            child: Column(
              children: [
                // Profile Picture
                ProfilePicture(
                  image:
                      'https://s3-alpha-sig.figma.com/img/f0c8/cd41/8a167708860c2f691b4707548fef93a1?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=G0xAy6~yn-LIHwyM6InsHhVWanJjaIbZkuQ1Dwi4rOFBYo0PX1oTgI6Wg8kcwCtvXHaEneJ-mMW94lVauYLMaPkfQKJs~gUXNlt5G7JZuO6f1UDPlspyvTuhZ8H996lSxFIy~je2MudWH0qKEpCDspu-Vy2hsTeT4MsubkB5UMQMHcUwIbTqmTbuKLGyxcQ5-QEi4RfU-TTcW0FFjJJkVfCf5gjVK14y-ehfJeobg4Fpb1KvDQo6njfZKvDJGbPEI0cTb3CYYS9hKSRCWUIUNabmuLtqp0wEpOZEgQ~BgPYsXZnfct~fJirk75gaVy90kxSCvI3oFjAjZCCmdBKcPw__',
                ),
                SizedBox(height: 15.h),
                Text(
                  "Alex Samuel",
                  style: appStyle(18, black, FontWeight.w600),
                ),
                SizedBox(height: 20.h),
                CustomTile(
                  name: "Account Information",
                  icon: "assets/icon/userperson.svg",
                  onTap:
                      () => Get.to(
                        () => AccountInfoScreen(),
                        id: 3,
                        transition: Transition.cupertino,
                      ),
                ),
                CustomTile(
                  name: "All Bookings",
                  icon: "assets/icon/ps_book.svg",
                  onTap:
                      () => Get.to(
                        () => AllBookingsProfile(),
                        id: 3,
                        transition: Transition.cupertino,
                      ),
                ),
                CustomTile(
                  name: "Settings",
                  icon: "assets/icon/settings_icon.svg",
                  onTap:
                      () => Get.to(
                        () => SettingsProfile(),
                        id: 3,
                        transition: Transition.cupertino,
                      ),
                ),
                CustomTile(
                  name: "Privacy Policy",
                  icon: "assets/icon/icon_lock.svg",
                  onTap: () {},
                ),
                CustomTile(
                  name: "Help Center",
                  icon: "assets/icon/warning-caution.svg",
                  onTap: () {},
                ),
                CustomTile(
                  name: "Log Out",
                  icon: "assets/icon/logout_icon.svg",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
