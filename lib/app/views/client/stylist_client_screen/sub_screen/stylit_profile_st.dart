import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:juststyle/app/common/app_style.dart';
import 'package:juststyle/app/theme/global_colors.dart';
import 'package:juststyle/app/views/client/stylist_client_screen/sub_screen/date_time_stylist.dart';
import 'package:juststyle/app/views/client/stylist_client_screen/sub_screen/photos_stylist.dart';
import 'package:juststyle/app/views/client/stylist_client_screen/sub_screen/reviews_stylist.dart';
import 'package:juststyle/app/views/client/stylist_client_screen/widgets/profile_header_section.dart';

class StylitProfileSt extends StatefulWidget {
  const StylitProfileSt({super.key});

  @override
  State<StylitProfileSt> createState() => _StylitProfileStState();
}

class _StylitProfileStState extends State<StylitProfileSt>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,

      child: Scaffold(
        key: _scaffoldkey,
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: white,
                expandedHeight: 400.h,
                flexibleSpace: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: ProfileHeaderSection(),
                ),
                bottom: TabBar(
                  isScrollable: true,
                  automaticIndicatorColorAdjustment: false,
                  tabAlignment: TabAlignment.center,
                  indicatorWeight: 3,
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: HexColor("#D6D6D6"),
                  indicatorColor: HexColor("#EAAA00"),
                  indicatorPadding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.symmetric(horizontal: 30.w),
                  unselectedLabelColor: HexColor("#666666"),
                  labelColor: HexColor("#EAAA00"),
                  labelStyle: appStyle(15, black, FontWeight.w400),
                  padding: EdgeInsets.only(left: 15.w, right: 15.w),
                  tabs: const [
                    Tab(text: 'Reviews'),
                    Tab(text: 'Photos'),
                    Tab(text: 'Date/Time'),
                  ],
                ),
              ),
            ];
          },

          body: TabBarView(
            children: [ReviewsStylist(), PhotosStylist(), DateTimeStylist()],
          ),
        ),
      ),
    );
  }
}
