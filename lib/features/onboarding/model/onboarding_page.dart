import 'package:juststyle/app/core/app_icon.dart';

class OnboardingPage {
  const OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;
}

const onboardingPages = <OnboardingPage>[
  OnboardingPage(
    image: AppIcon.onboarding1,
    title: 'Every Client is Special',
    description:
        'Perfect hair branding app for your beauty and comfortable life',
  ),
  OnboardingPage(
    image: AppIcon.onboarding2,
    title: 'Discover Nearby Vendors',
    description:
        'where your perfect look and relaxation meet, just around the corner',
  ),
  OnboardingPage(
    image: AppIcon.onboarding3,
    title: 'Every Client is Special',
    description:
        'Perfect hair branding app for your beauty and comfortable life',
  ),
];
