import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:juststyle/app/views/client/hi_screen.dart';

class HomeClientScreen extends StatelessWidget {
  const HomeClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Get.to(() => HiScreen(), id: 0);
          },
          child: Text('tap me home'),
        ),
      ),
    );
  }
}
