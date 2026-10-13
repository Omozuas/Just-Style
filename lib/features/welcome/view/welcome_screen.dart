import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:juststyle/app/core/app_icon.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/app/router/app_routes.dart';
import 'package:juststyle/app/session/app_session.dart';
import 'package:juststyle/core/locator/service_locator.dart';
import 'package:juststyle/features/welcome/view/widgets/welcome_slideshow.dart';
import 'package:juststyle/shared/widgets/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const _images = [
    AppIcon.welcome1,
    AppIcon.welcome2,
    AppIcon.welcome3,
    AppIcon.welcome4,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const WelcomeSlideshow(images: _images),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: paddingOnly(left: 16, right: 16, bottom: 24),
              child: Column(
                children: [
                  AppButton(
                    text: 'As Client',
                    height: 46,
                    radius: 20,
                    onPressed: () {
                      appSession.role = AppRole.client;
                      context.go(AppRoutes.onboarding);
                    },
                  ),
                  gapH(16),
                  AppButton(
                    text: 'As Stylist',
                    height: 46,
                    radius: 20,
                    onPressed: () {
                      appSession.role = AppRole.stylist;
                      context.go(AppRoutes.onboarding);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
