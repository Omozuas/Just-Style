import 'package:flutter_test/flutter_test.dart';
import 'package:juststyle/app/core/sizing/screen_size_service.dart';
import 'package:juststyle/core/locator/service_locator.dart';

void main() {
  test('locator registers the screen size service', () async {
    await setupLocator();

    expect(screenSizeService, isA<ScreenSizeService>());
    expect(screenSizeService.figmaWidth, 375);
    expect(screenSizeService.figmaHeight, 825);
  });
}
