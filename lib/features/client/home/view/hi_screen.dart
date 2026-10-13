import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HiScreen extends StatelessWidget {
  const HiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Text(' hi go back'),
        ),
      ),
    );
  }
}
