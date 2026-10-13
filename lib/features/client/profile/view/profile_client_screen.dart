import 'package:flutter/material.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:go_router/go_router.dart';
import 'package:juststyle/app/core/app_icon.dart';
import 'package:juststyle/app/router/app_routes.dart';
import 'package:juststyle/app/core/app_style.dart';
import 'package:juststyle/app/core/custom_tile.dart';
import 'package:juststyle/app/theme/global_colors.dart';
import 'package:juststyle/features/client/profile/view/widgets/profile_picture.dart';

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
                  icon: AppIcon.account,
                  onTap: () => context.push(AppRoutes.profileAccount),
                ),
                CustomTile(
                  name: "All Bookings",
                  icon: AppIcon.bookingsList,
                  onTap: () => context.push(AppRoutes.profileBookings),
                ),
                CustomTile(
                  name: "Settings",
                  icon: AppIcon.settings,
                  onTap: () => context.push(AppRoutes.profileSettings),
                ),
                CustomTile(
                  name: "Privacy Policy",
                  icon: AppIcon.privacy,
                  onTap: () {},
                ),
                CustomTile(
                  name: "Help Center",
                  icon: AppIcon.help,
                  onTap: () {},
                ),
                CustomTile(
                  name: "Log Out",
                  icon: AppIcon.logout,
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
