import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:juststyle/app/core/app_icon.dart';
import 'package:juststyle/shared/widgets/app_bottom_nav.dart';

class BaseClientScreen extends StatelessWidget {
  const BaseClientScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  static const _destinations = [
    AppNavDestination(icon: AppIcon.home, label: 'Home'),
    AppNavDestination(icon: AppIcon.bookings, label: 'Bookings'),
    AppNavDestination(icon: AppIcon.stylist, label: 'Stylist'),
    AppNavDestination(icon: AppIcon.profile, label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    final index = navigationShell.currentIndex;
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: AppBottomNav(
        currentIndex: index,
        destinations: _destinations,
        onTap: (value) {
          navigationShell.goBranch(value, initialLocation: value == index);
        },
      ),
    );
  }
}
