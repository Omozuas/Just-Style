import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:juststyle/app/common/app_style.dart';
import 'package:juststyle/app/common/custom_search_field.dart';
import 'package:juststyle/app/common/search_button.dart';
import 'package:juststyle/app/theme/global_colors.dart';
import 'package:juststyle/app/views/client/booking_client_screen/widgets/bookins_card.dart';

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
          onTap: () => Get.back(canPop: true, id: 3),
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
                  children: List.generate(17, (i) {
                    return GestureDetector(
                      onTap: () {},
                      child: BookinsCard(
                        nameOfHair: "Top Knot Braids",
                        date: "8/11/2023",
                        time: "9:14am",
                        amount: "\$  2000",
                        rating: "4.9",
                        image:
                            "https://s3-alpha-sig.figma.com/img/f0c8/cd41/8a167708860c2f691b4707548fef93a1?Expires=1744588800&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=Ep69CI6j8SZVOILrvwtaWQarqp9LP1poRq1seYaKjJOze~BA0LEEddvjmwUXba1yTIhrh0wL6xzmM0V3N7tPuU~hzUmLdUj3YtqbAk2ACmXbZOACVyILFQ4oUavO-Cl8pWe4gVU6NaEXyj8rWuN9yvN0ve6D6nEpHLWu4kZiyiWcDy-FKTsroUp1CWTBavzp0RF8GYwEeSsPw9u47E6bCdWXY2~1KmyoI6TcflZKwBrwpVZLg7lYF6M8wbDgRlBB2fx3eNbFLwKJmXGvu4ZGnm8FKPsak8DazX500U0RQPARb0dUN1JoLfpjVvht7lcd6TTf93pmewzhPUApkei6LA__",
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
