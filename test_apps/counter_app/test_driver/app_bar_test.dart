import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'github_firendly_ozzie.dart';

void main() {
  group('App Bar', () {
    FlutterDriver driver;
    GithubFriendlyOzzie ozzie;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
      ozzie = GithubFriendlyOzzie.initWith(driver, groupName: 'counter-app');
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
