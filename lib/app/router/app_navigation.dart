import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:juststyle/app/router/app_routes.dart';

extension AppNavigation on BuildContext {
  String get clientTabRoot {
    final shell = StatefulNavigationShell.maybeOf(this);
    return switch (shell?.currentIndex) {
      1 => AppRoutes.bookings,
      2 => AppRoutes.stylists,
      3 => AppRoutes.profile,
      _ => AppRoutes.home,
    };
  }

  void openStylistProfile() {
    final path = clientTabRoot == AppRoutes.stylists
        ? AppRoutes.stylistsProfile
        : AppRoutes.homeStylist;
    push(path);
  }
}
