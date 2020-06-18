import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;
//  String platform;

  Future<bool> isDeviceBig() => driver
      .getBottomRight(find.byValueKey('FramyApp'))
      .then((offset) => offset.dx >= 1000);

  setUpAll(() async {
    driver = await FlutterDriver.connect();
//    platform = Platform.environment['PLATFORM'] ?? 'default_macos';
  });

  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });

  group('UserDataCard', () {
    setUpAll(() async {
      if (!await isDeviceBig()) {
        await driver.tap(find.byTooltip('Open navigation menu'));
      }
      await driver.waitFor(find.text('UserDataCard'));
      await driver.tap(find.text('UserDataCard'));
    });

    test('should have UserDataCard in UserDataCard page', () async {
      await driver.waitFor(find.byValueKey('UserDataCard'));
    });
  });
}
