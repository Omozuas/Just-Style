import 'dart:async';

import 'package:flutter/material.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/app/theme/app_colors.dart';
import 'package:juststyle/features/onboarding/model/onboarding_page.dart';
import 'package:juststyle/features/onboarding/view/widgets/onboarding_dots.dart';
import 'package:juststyle/features/onboarding/view/widgets/onboarding_page_body.dart';
import 'package:juststyle/shared/widgets/app_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({
    super.key,
    required this.pages,
    required this.onLogin,
    required this.onSignUp,
  });

  final List<OnboardingPage> pages;
  final VoidCallback onLogin;
  final VoidCallback onSignUp;

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  static const _hold = Duration(seconds: 10);
  static const _slide = Duration(milliseconds: 500);

  final PageController _pageController = PageController();
  Timer? _timer;
  int _page = 0;
  bool _holding = false;

  @override
  void initState() {
    super.initState();
    _startAutoAdvance();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoAdvance() {
    _timer?.cancel();
    if (widget.pages.length < 2) return;
    _timer = Timer.periodic(_hold, (_) => _advance());
  }

  void _advance() {
    if (!mounted || _holding || !_pageController.hasClients) return;
    final next = (_page + 1) % widget.pages.length;
    _pageController.animateToPage(
      next,
      duration: _slide,
      curve: Curves.easeInOut,
    );
  }

  bool _onScroll(ScrollNotification notification) {
    if (notification.depth != 0) return false;
    if (notification is ScrollStartNotification &&
        notification.dragDetails != null) {
      _holding = true;
      _timer?.cancel();
    } else if (notification is ScrollEndNotification && _holding) {
      _holding = false;
      _startAutoAdvance();
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.pages.isEmpty) {
      return const Scaffold(body: SizedBox.shrink());
    }

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: paddingOnly(left: 16, right: 16, bottom: 16),
          child: Column(
            children: [
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: _onScroll,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: widget.pages.length,
                    onPageChanged: (index) => setState(() => _page = index),
                    itemBuilder: (context, index) {
                      return OnboardingPageBody(page: widget.pages[index]);
                    },
                  ),
                ),
              ),
              gapH(24),
              OnboardingDots(count: widget.pages.length, index: _page),
              gapH(28),
              AppButton(
                text: 'Login',
                radius: 24,
                height: 46,
                vertical: 0,
                onPressed: widget.onLogin,
              ),
              gapH(16),
              AppButton(
                text: 'Sign Up',
                variant: ButtonVariant.light,
                radius: 24,
                height: 46,
                vertical: 0,
                onPressed: widget.onSignUp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
