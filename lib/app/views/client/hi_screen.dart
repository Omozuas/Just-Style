import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HiScreen extends StatelessWidget {
  const HiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Get.back(id: 0);
          },
          child: Text(' hi go back'),
        ),
      ),
    );
  }
}
