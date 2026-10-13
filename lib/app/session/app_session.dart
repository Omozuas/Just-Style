import 'package:juststyle/app/router/app_routes.dart';

enum AppRole { client, stylist }

class AppSession {
  AppRole role = AppRole.client;

  String get homePath =>
      role == AppRole.stylist ? AppRoutes.stylistHome : AppRoutes.home;
}
