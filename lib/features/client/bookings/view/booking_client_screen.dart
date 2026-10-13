import 'package:flutter/material.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/app/core/app_style.dart';
import 'package:juststyle/app/theme/global_colors.dart';
import 'package:juststyle/features/client/bookings/model/booking.dart';
import 'package:juststyle/features/client/bookings/view/widgets/bookins_card.dart';

class BookingClientScreen extends StatelessWidget {
  const BookingClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bookings", style: appStyle(21, black, FontWeight.w600)),
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
                ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
