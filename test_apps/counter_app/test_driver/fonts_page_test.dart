import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'github_firendly_ozzie.dart';

void main() {
  group('Fonts page', () {
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

    test('should be displayed', () async {
      await driver.waitFor(find.byValueKey('FramyFontsPage'));
      await ozzie.takeScreenshot('fonts_page_is_displayed');
    });

    test('should have all text names', () async {
      await driver.waitFor(find.text('Headline1'));
      await driver.waitFor(find.text('Headline2'));
      await driver.waitFor(find.text('Headline3'));
      await driver.waitFor(find.text('Headline4'));
      await driver.waitFor(find.text('Headline5'));
      await driver.waitFor(find.text('Headline6'));
      await driver.waitFor(find.text('BodyText1'));
      await driver.waitFor(find.text('BodyText2'));
      await driver.waitFor(find.text('Subtitle1'));
      await driver.waitFor(find.text('Subtitle2'));
      await driver.waitFor(find.text('Caption'));
      await driver.waitFor(find.text('Button'));
      await driver.waitFor(find.text('Overline'));
    });
  });
}
