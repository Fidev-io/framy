import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'github_firendly_ozzie.dart';

void main() {
  FlutterDriver driver;
  GithubFriendlyOzzie ozzie;
  String platform;

  Future<bool> isDeviceBig() => driver
      .getBottomRight(find.byValueKey('FramyApp'))
      .then((offset) => offset.dx >= 1000);

  setUpAll(() async {
    driver = await FlutterDriver.connect();
    ozzie = GithubFriendlyOzzie.initWith(driver, groupName: 'counter-app');
    platform = Platform.environment['PLATFORM'] ?? 'default_macos';
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
      await ozzie.takeScreenshot('${platform}_appbar_is_visible');
    });

    test('should have Switch for wrapping with Scaffold', () async {
      await driver.waitFor(find.byValueKey('FramyAppScaffoldSwitch'));
    });
  });

  group('Fonts page', () {
    test('should be displayed', () async {
      await driver.waitFor(find.byValueKey('FramyFontsPage'));
      await ozzie.takeScreenshot('${platform}_fonts_page_is_displayed');
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

  group('Drawer', () {
    test('should be openable by drawer icon on small devices', () async {
      if (!await isDeviceBig()) {
        //given
        await driver.waitForAbsent(find.byValueKey('FramyDrawer'));
        //when
        await driver.tap(find.byTooltip('Open navigation menu'));
        //then
        await driver.waitFor(find.byValueKey('FramyDrawer'));
        await ozzie.takeScreenshot('${platform}_drawer');
      }
    });

    test('should be always opened on big screens', () async {
      if (await isDeviceBig()) {
        await driver.waitFor(find.byValueKey('FramyDrawer'));
        await driver.waitForAbsent(find.byTooltip('Open navigation menu'));
        await ozzie.takeScreenshot('${platform}_drawer');
      }
    });

    test('should have Typography list item', () async {
      await driver.waitFor(find.text('Typography'));
    });

    test('should have Color scheme list item', () async {
      await driver.waitFor(find.text('Color scheme'));
    });
  });

  group('ColorsPage', () {
    test('should show ColorScheme page when Color scheme is tapped', () async {
      await driver.tap(find.text('Color scheme'));
      await driver.waitFor(find.byValueKey('FramyColorsPage'));
      await ozzie.takeScreenshot('${platform}_colors_page');
    });

    test('should show color names and values', () async {
      await driver.waitFor(find.text('Primary'));
      await driver.waitFor(find.text('#FF2196F3'));
      await driver.waitFor(find.text('Primary light'));
      await driver.waitFor(find.text('#FFBBDEFB'));
      await driver.waitFor(find.text('Primary dark'));
      await driver.waitFor(find.text('#FF1976D2'));
      await driver.waitFor(find.text('Canvas'));
      await driver.waitFor(find.text('#FFFAFAFA'));
      await driver.waitFor(find.text('Accent'));
      await driver.waitFor(find.text('#FF2196F3'));
      await driver.waitFor(find.byValueKey('Scaffold background'));
      await driver.waitFor(find.text('#FFFAFAFA'));
      await driver.waitFor(find.text('Bottom appbar'));
      await driver.waitFor(find.text('#FFFFFFFF'));
      await driver.waitFor(find.text('Card'));
      await driver.waitFor(find.text('#FFFFFFFF'));
      await driver.waitFor(find.text('Divider'));
      await driver.waitFor(find.text('#1F000000'));
      await driver.waitFor(find.text('Focus'));
      await driver.waitFor(find.text('#1F000000'));
      await driver.waitFor(find.text('Hover'));
      await driver.waitFor(find.text('#0A000000'));
      await driver.waitFor(find.text('Highlight'));
      await driver.waitFor(find.text('#66BCBCBC'));
      await driver.waitFor(find.text('Splash'));
      await driver.waitFor(find.text('#66C8C8C8'));
      await driver.waitFor(find.text('Disabled'));
      await driver.waitFor(find.text('#61000000'));
      await driver.waitFor(find.text('Button'));
      await driver.waitFor(find.text('#FFE0E0E0'));
      await driver.waitFor(find.text('Text selection'));
      await driver.waitFor(find.text('#FF64B5F6'));
      await driver.waitFor(find.text('Cursor'));
      await driver.waitFor(find.text('#FF4285F4'));
      await driver.waitFor(find.byValueKey('Text selection handle'));
      await driver.waitFor(find.text('#FF64B5F6'));
      await driver.scrollUntilVisible(
        find.byType('GridView'),
        find.byValueKey('Toggleable Active'),
        dyScroll: -100,
      );
      await driver.waitFor(find.text('Background'));
      await driver.waitFor(find.text('#FF90CAF9'));
      await driver.waitFor(find.byValueKey('Dialog background'));
      await driver.waitFor(find.text('#FFFFFFFF'));
      await driver.waitFor(find.text('Indicator'));
      await driver.waitFor(find.text('#FF2196F3'));
      await driver.waitFor(find.text('Hint'));
      await driver.waitFor(find.text('#8A000000'));
      await driver.waitFor(find.byValueKey('Toggleable Active'));
      await driver.waitFor(find.text('#FF1E88E5'));
    });

    test('Uses defined custom error color', () async {
      await driver.waitFor(find.text('Error'));
      await driver.waitFor(find.text('#FFFF5252'));
    });

    test('should show MaterialScheme color names and values', () async {
      await driver.scrollUntilVisible(
        find.byType('GridView'),
        find.text('On primary'),
        dyScroll: -100,
      );
      await driver.waitFor(find.text('Primary'));
      await driver.waitFor(find.text('#FF2196F3'));
      await driver.waitFor(find.text('Primary variant'));
      await driver.waitFor(find.text('#FF1976D2'));
      await driver.waitFor(find.text('Secondary'));
      await driver.waitFor(find.text('#FF2196F3'));
      await driver.waitFor(find.text('Secondary variant'));
      await driver.waitFor(find.text('#FF1976D2'));
      await driver.waitFor(find.text('Background'));
      await driver.waitFor(find.text('#FF90CAF9'));
      await driver.waitFor(find.text('Surface'));
      await driver.waitFor(find.text('#FFFFFFFF'));
      await driver.waitFor(find.text('Error'));
      await driver.waitFor(find.text('#FFFF5252'));
      await driver.waitFor(find.text('On primary'));
      await driver.waitFor(find.text('#FFFFFFFF'));
      await driver.waitFor(find.text('On secondary'));
      await driver.waitFor(find.text('#FFFFFFFF'));
      await driver.waitFor(find.text('On background'));
      await driver.waitFor(find.text('#FFFFFFFF'));
      await driver.waitFor(find.text('On surface'));
      await driver.waitFor(find.text('#FF000000'));
      await driver.waitFor(find.text('On error'));
      await driver.waitFor(find.text('#FFFFFFFF'));
    });
  });

  group('Material components', () {
    setUp(() async {
      if (!await isDeviceBig()) {
        await driver.tap(find.byTooltip('Open navigation menu'));
      }
    });

    Future<void> openMaterialComponentsPage(String name) async {
      await driver.tap(find.text('Material components'));
      await driver.waitFor(find.text(name));
      await driver.tap(find.text(name));
    }

    test('should have AppBar page', () async {
      await openMaterialComponentsPage('AppBar');
      await driver.waitFor(find.byValueKey('FramyAppBarPage'));
      await ozzie.takeScreenshot('${platform}_appbar_page');
    });

    test('should have Button page', () async {
      await openMaterialComponentsPage('Button');
      await driver.waitFor(find.byValueKey('FramyButtonPage'));
      await ozzie.takeScreenshot('${platform}_button_page');
    });

    test('should have Toggle page', () async {
      await openMaterialComponentsPage('Toggle');
      await driver.waitFor(find.byValueKey('FramyTogglePage'));
      await ozzie.takeScreenshot('${platform}_toggle_page');
    });

    test('should have TextField page', () async {
      await openMaterialComponentsPage('TextField');
      await driver.waitFor(find.byValueKey('FramyTextFieldPage'));
      await ozzie.takeScreenshot('${platform}_textfield_page');
    });
  });

  group('CounterFAB', () {
    setUpAll(() async {
      if (!await isDeviceBig()) {
        await driver.tap(find.byTooltip('Open navigation menu'));
      }
    });

    test('should have CounterFAB in drawer', () async {
      await driver.waitFor(find.text('CounterFAB'));
    });

    test('should go to CounterFAB page after tap on CounterFAB in drawer',
        () async {
      await driver.tap(find.text('CounterFAB'));
      await driver.waitFor(find.byValueKey('Framy_CounterFAB_Page'));
      await ozzie.takeScreenshot('${platform}_CounterFAB_page');
    });

    test('should have counterFAB in CounterFAB page', () async {
      await driver.waitFor(find.byValueKey('MyCounterFAB'));
    });
  });

  group('CounterTitle', () {
    setUpAll(() async {
      if (!await isDeviceBig()) {
        await driver.tap(find.byTooltip('Open navigation menu'));
      }
      await driver.tap(find.text('CounterTitle'));
    });

    test('should have default title text', () async {
      await driver
          .waitFor(find.text('You have pushed the button this many times:'));
    });

    test('should have a device preview', () async {
      await driver.waitFor(find.descendant(
        of: find.byType('DevicePreview'),
        matching: find.text('You have pushed the button this many times:'),
      ));
    });

    test('should have a dependencies panel', () async {
      if (!await isDeviceBig()) {
        await driver.tap(find.byValueKey('FramyWidgetDependenciesButton'));
      }
      await driver.waitFor(find.byValueKey('FramyWidgetDependenciesPanel'));
    });

    test('should have a default value typed in', () async {
      await driver.waitFor(find.text('pushed'));
    });

    test('should allow to set verb to null', () async {
      await driver.tap(find.byValueKey('framy_verb_preset_dropdown'));
      await driver.tap(find.text('Null'));
      await driver
          .waitFor(find.text('You have null the button this many times:'));
    });

    test('should use the default value after setting back to non-null',
        () async {
      await driver.tap(find.byValueKey('framy_verb_preset_dropdown'));
      await driver.tap(find.text('Custom'));
      await driver
          .waitFor(find.text('You have pushed the button this many times:'));
    });

    test(
        'should change displayed text when text typed into the dependencies panel',
        () async {
      await driver.tap(find.byValueKey('framy_dependency_verb_input'));
      await driver.enterText('Foo Foo');
      await driver
          .waitFor(find.text('You have Foo Foo the button this many times:'));
    });

    test(
      'should change counter text when number typed into the dependencies panel',
      () async {
        await driver.tap(find.byValueKey('framy_dependency_counter_input'));
        await driver.enterText('17');
        await driver.waitFor(find.descendant(
          of: find.byValueKey('Counter title'),
          matching: find.text('17'),
        ));
      },
    );

    test(
      'should not change the value and display error message when invalid int text is typed',
      () async {
        await driver.enterText('17abc');
        await driver.waitFor(find.text('Invalid integer value'));
        await driver.waitFor(find.descendant(
          of: find.byValueKey('Counter title'),
          matching: find.text('17'),
        ));
      },
    );
  });
}
