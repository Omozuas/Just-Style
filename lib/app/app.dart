import 'package:flutter/material.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/app/router/app_router.dart';
import 'package:juststyle/app/theme/global_colors.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenSizeService.updateFromContext(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Just Stlye',
      theme: ThemeData(
        scaffoldBackgroundColor: white,
        iconTheme: IconThemeData(color: black),
        primaryColor: deemYellow,
      ),
      routerConfig: appRouter,
    );
  }
}
