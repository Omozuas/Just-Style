import 'package:flutter/material.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/app/theme/app_colors.dart';
import 'package:juststyle/features/client/home/view/widgets/home_header.dart';
import 'package:juststyle/shared/widgets/app_search_bar.dart';
import 'package:juststyle/features/client/home/view/widgets/home_section_title.dart';
import 'package:juststyle/app/core/app_icon.dart';
import 'package:juststyle/shared/widgets/app_banner.dart';
import 'package:juststyle/features/client/home/view/widgets/popular_braid_grid.dart';
import 'package:juststyle/features/client/home/view/widgets/popular_stylist_list.dart';

class ClientHomeScreen extends StatelessWidget {
  const ClientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: paddingOnly(left: 16, right: 16, top: 12, bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(),
              gapH(18),
              const AppSearchBar(),
              gapH(22),
              const HomeSectionTitle(title: 'Special Offer'),
              gapH(12),
              const AppBanner(
                image: AssetImage(AppIcon.homeOffer),
                title: 'Discover Amazing Braids',
                caption: 'Up to',
                highlight: '30%',
                buttonLabel: 'Claim',
              ),
              gapH(22),
              const HomeSectionTitle(title: 'Popular Stylist', showSeeAll: true),
              gapH(12),
              const PopularStylistList(),
              gapH(8),
              const HomeSectionTitle(title: 'Popular Braids', showSeeAll: true),
              gapH(12),
              const PopularBraidGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
