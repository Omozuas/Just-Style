import 'package:flutter/material.dart';
import 'package:juststyle/app/app.dart';
import 'package:juststyle/core/locator/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}
