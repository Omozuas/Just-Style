import 'package:get_it/get_it.dart';
import 'package:juststyle/app/core/sizing/screen_size_service.dart';
import 'package:juststyle/app/session/app_session.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerSingleton(ScreenSizeService());
  locator.registerSingleton(AppSession());
  await locator.allReady();
}

ScreenSizeService get screenSizeService => locator.get<ScreenSizeService>();

AppSession get appSession => locator.get<AppSession>();
