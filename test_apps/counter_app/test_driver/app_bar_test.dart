import 'package:flutter_driver/flutter_driver.dart';
import 'package:ozzie/ozzie.dart';
import 'package:test/test.dart';

void main() {
  group('App Bar', () {
    FlutterDriver driver;
    Ozzie ozzie;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
      ozzie = Ozzie.initWith(driver, groupName: 'counter-app');
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
      ozzie.generateHtmlReport();
    });

    test('should be visible', () async {
      await driver.waitFor(find.byValueKey('FramyAppBar'));
      await ozzie.takeScreenshot('appbar_is_visible');
    });
  });
}
