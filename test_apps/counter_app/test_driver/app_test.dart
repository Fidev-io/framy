import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'github_firendly_ozzie.dart';

void main() {
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

  group('App Bar', () {
    test('should be visible', () async {
      await driver.waitFor(find.byValueKey('FramyAppBar'));
      await ozzie.takeScreenshot('appbar_is_visible');
    });
  });

  group('Fonts page', () {
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

    test('should display styles descriptions for macOS', () async {
      await driver.waitFor(find.text(
          '.SF UI Display / size: 112.0 / weight: w100 / color: #8A000000'));
      await driver.waitFor(find.text(
          '.SF UI Display / size: 56.0 / weight: w400 / color: #8A000000'));
      await driver.waitFor(find.text(
          '.SF UI Display / size: 45.0 / weight: w400 / color: #8A000000'));
      await driver.waitFor(find.text(
          '.SF UI Display / size: 34.0 / weight: w400 / color: #8A000000'));
      await driver.waitFor(find.text(
          '.SF UI Display / size: 24.0 / weight: w400 / color: #DD000000'));
      await driver.waitFor(find.text(
          '.SF UI Display / size: 20.0 / weight: w500 / color: #DD000000'));
      await driver.waitFor(find
          .text('.SF UI Text / size: 16.0 / weight: w400 / color: #DD000000'));
      await driver.waitFor(find.text(
          '.SF UI Text / size: 14.0 / weight: w500 / color: #FF000000 / letter spacing: 0.1'));
      await driver.waitFor(find
          .text('.SF UI Text / size: 14.0 / weight: w500 / color: #DD000000'));
      await driver.waitFor(find
          .text('.SF UI Text / size: 14.0 / weight: w400 / color: #DD000000'));
      await driver.waitFor(find
          .text('.SF UI Text / size: 12.0 / weight: w400 / color: #8A000000'));
      await driver.waitFor(find
          .text('.SF UI Text / size: 14.0 / weight: w500 / color: #DD000000'));
      await driver.waitFor(find.text(
          '.SF UI Text / size: 10.0 / weight: w400 / color: #FF000000 / letter spacing: 1.5'));
    });
  });
}
