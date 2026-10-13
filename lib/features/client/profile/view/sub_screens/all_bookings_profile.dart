import 'package:flutter/material.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:juststyle/app/core/app_style.dart';
import 'package:juststyle/app/core/custom_search_field.dart';
import 'package:juststyle/app/core/search_button.dart';
import 'package:juststyle/app/theme/global_colors.dart';
import 'package:juststyle/features/client/bookings/model/booking.dart';
import 'package:juststyle/features/client/bookings/view/widgets/bookins_card.dart';

class AllBookingsProfile extends StatefulWidget {
  const AllBookingsProfile({super.key});

  @override
  State<AllBookingsProfile> createState() => _AllBookingsProfileState();
}

class _AllBookingsProfileState extends State<AllBookingsProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Icon(Icons.arrow_back_ios_new, color: black),
        ),
        title: Text(
          "All Bookings",
          style: appStyle(21, HexColor("#1F1F1F"), FontWeight.w600),
        ),
        centerTitle: true,
        foregroundColor: white,
        backgroundColor: white,
        surfaceTintColor: white,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 15.h,
            left: 15.w,
            right: 15.w,
            // bottom: 15.h,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: CustomSearchField(onChanged: (p0) {})),
                  SizedBox(width: 13.w),
                  SearchButton(onTap: () {}),
                ],
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children: [
                    for (final booking in sampleBookings())
                      GestureDetector(
                        onTap: () {},
                        child: BookinsCard(
                          nameOfHair: booking.styleName,
                          date: booking.date,
                          time: booking.time,
                          amount: booking.amount,
                          rating: booking.rating,
                          image: booking.imageUrl,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
