import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;
//  String platform;

  Future<bool> isDeviceBig() => driver
      .getBottomRight(find.byValueKey('FramyApp'))
      .then((offset) => offset.dx >= 1000);

  Future<void> closeDependenciesPanelAndGoToOtherPage(String name,
      {bool openDependenciesPanel = false}) async {
    if (!await isDeviceBig()) {
      //hide modal bottom sheet
      await driver.scroll(
        find.byValueKey('framySheetDragHandle'),
        0,
        500,
        Duration(milliseconds: 100),
      );
      await driver.tap(find.byTooltip('Open navigation menu'));
    }
    await driver.waitFor(find.text(name));
    await driver.tap(find.text(name));
    if (openDependenciesPanel && !await isDeviceBig()) {
      await driver.tap(find.byValueKey('FramyWidgetDependenciesButton'));
    }
  }

  Future<void> _scrollToAddButton(String fieldName) {
    return driver.scrollUntilVisible(
      find.byType('SingleChildScrollView'),
      find.text('+ Add $fieldName element'),
      dyScroll: -100,
    );
  }

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

    test('should allow to change user parameters', () async {
      if (!await isDeviceBig()) {
        await driver.tap(find.byValueKey('FramyWidgetDependenciesButton'));
      }
      await driver.waitFor(find.byValueKey('FramyWidgetDependenciesPanel'));
      await driver.waitFor(find.text('user'));
      await driver.waitFor(find.text('firstName'));
      await driver.tap(find.byValueKey('framy_dependency_firstName_input'));
      await driver.enterText('John');
      await driver.tap(find.byValueKey('framy_dependency_lastName_input'));
      await driver.enterText('Doe');
      await driver.tap(find.byValueKey('framy_dependency_age_input'));
      await driver.enterText('17');
      await driver.waitFor(find.text('John Doe'));
      await driver.waitFor(find.text('Age: 17'));
    });

    test('should allow to use a user preset', () async {
      await driver.tap(find.byValueKey('framy_user_preset_dropdown'));
      await driver.tap(find.text('teenageJohn'));
      await driver.waitFor(find.text('John Smith'));
      await driver.waitFor(find.text('Age: 13'));
      await driver
          .waitForAbsent(find.byValueKey('framy_dependency_firstName_input'));
      await driver
          .waitForAbsent(find.byValueKey('framy_dependency_lastName_input'));
      await driver.waitForAbsent(find.byValueKey('framy_dependency_age_input'));
    });

    test('should come back to custom user', () async {
      await driver.tap(find.byValueKey('framy_user_preset_dropdown'));
      await driver.tap(find.text('Custom'));
      await driver.waitFor(find.text('John Doe'));
      await driver.waitFor(find.text('Age: 17'));
    });

    test('should set user to null', () async {
      await driver.tap(find.byValueKey('framy_user_preset_dropdown'));
      await driver.tap(find.text('Null'));
      await driver.waitFor(find.text('null null'));
      await driver.waitFor(find.text('Age: null'));
    });

    test(
        'should restore user properties to not null values when user is set to not null',
        () async {
      await driver.tap(find.byValueKey('framy_user_preset_dropdown'));
      await driver.tap(find.text('Custom'));
      await driver.waitFor(find.text('John Doe'));
      await driver.waitFor(find.text('Age: 17'));
    });
  });

  group('UserEmailsView', () {
    setUpAll(() async {
      await closeDependenciesPanelAndGoToOtherPage('UserEmailsView');
    });

    test('should have UserEmailsView in UserEmailsView page', () async {
      await driver.waitFor(find.byValueKey('UserEmailsView'));
    });

    test('should show no email text by default', () async {
      await driver.waitFor(find.text('No email'));
    });

    test('should allow to add an email', () async {
      if (!await isDeviceBig()) {
        await driver.tap(find.byValueKey('FramyWidgetDependenciesButton'));
      }
      await driver.waitFor(find.byValueKey('FramyWidgetDependenciesPanel'));
      await _scrollToAddButton('emails');
      await driver.tap(find.text('+ Add emails element'));
      await _scrollToAddButton('emails');
      await driver
          .tap(find.byValueKey('framy_dependency_List element 1_input'));
      await driver.enterText('john@gmail.com');
      await driver.waitFor(find.descendant(
        of: find.byValueKey('UserEmailsView'),
        matching: find.text('john@gmail.com'),
      ));
    });

    test('should allow to add second email', () async {
      await _scrollToAddButton('emails');
      await driver.tap(find.text('+ Add emails element'));
      await _scrollToAddButton('emails');
      await driver
          .tap(find.byValueKey('framy_dependency_List element 2_input'));
      await driver.enterText('john2@gmail.com');
      //confirm previous email is still there
      await driver.waitFor(find.descendant(
        of: find.byValueKey('UserEmailsView'),
        matching: find.text('john@gmail.com'),
      ));
      //and that new email has been added
      await driver.waitFor(find.descendant(
        of: find.byValueKey('UserEmailsView'),
        matching: find.text('john2@gmail.com'),
      ));
    });

    test('should allow remove email from list', () async {
      await driver.tap(
          find.byValueKey('framy_dependency_List element 1_delete_button'));
      await driver.waitForAbsent(find.text('john@gmail.com'));
    });
  });

  group('ProfilePage', () {
    test('should have user dependency which is passed by provider', () async {
      await closeDependenciesPanelAndGoToOtherPage('ProfilePage');
      //test it by changing name
      if (!await isDeviceBig()) {
        await driver.tap(find.byValueKey('FramyWidgetDependenciesButton'));
      }
      await driver.waitFor(find.byValueKey('FramyWidgetDependenciesPanel'));
      await driver.tap(find.byValueKey('framy_dependency_age_input'));
      await driver.enterText('17');
      await driver.waitFor(find.text('Age: 17'));
      //test it by preset as well
      await driver.tap(find.byValueKey('framy_User_preset_dropdown'));
      await driver.tap(find.text('teenageJohn'));
      await driver.waitFor(find.text('Age: 13'));
    });
  });

  group('WeightUnitDisplay', () {
    test('should have a working enum dropdown', () async {
      await closeDependenciesPanelAndGoToOtherPage('WeightUnitDisplay');
      if (!await isDeviceBig()) {
        await driver.tap(find.byValueKey('FramyWidgetDependenciesButton'));
      }
      await driver.waitFor(find.byValueKey('FramyWidgetDependenciesPanel'));
      //by default should be kg
      await driver.waitFor(find.descendant(
        of: find.byType('WeightUnitDisplay'),
        matching: find.text('kg'),
      ));
      //select lbs
      await driver.tap(find.byValueKey('framy_dependency_weightUnit_input'));
      await driver.tap(find.text('lbs'));
      //should display lbs in the UI
      await driver.waitFor(find.descendant(
        of: find.byType('WeightUnitDisplay'),
        matching: find.text('lbs'),
      ));
    });

    test(
      'should use previous enum value after setting back from null',
      () async {
        //set to null
        await driver.tap(find.byValueKey('framy_weightUnit_preset_dropdown'));
        await driver.tap(find.text('Null'));
        //confirm that "kg" is not displayed
        await driver.waitForAbsent(find.descendant(
          of: find.byType('WeightUnitDisplay'),
          matching: find.text('lbs'),
        ));
        //set to non-null
        await driver.tap(find.byValueKey('framy_weightUnit_preset_dropdown'));
        await driver.tap(find.text('Custom'));
        //confirm that now "kg" is displayed again
        await driver.waitFor(find.descendant(
          of: find.byType('WeightUnitDisplay'),
          matching: find.text('lbs'),
        ));
      },
    );
  });

  group('WeightEntryListItem', () {
    test('should show datepicker when DateTime dependency', () async {
      await closeDependenciesPanelAndGoToOtherPage(
        'WeightEntryListItem',
        openDependenciesPanel: true,
      );
      await driver.tap(find.byValueKey('framy_dependency_dateTime_input'));
      await driver.waitFor(find.byType('_DatePickerDialog'));
    });

    test('should update value on datePicker selection', () async {
      final now = DateTime.now();
      await driver.tap(find.text('17'));
      await driver.tap(find.text('OK'));
      await driver.waitFor(find.text(
          '${now.year}-${now.month.toString().padLeft(2, '0')}-17 00:00:00'));
    });

    test('should allow to change WeightEntry constructor', () async {
      //before changing, those fields should be visible
      await driver.waitFor(find.text('dateTime'));
      await driver.waitFor(find.text('note'));
      await driver.waitFor(find.text('weight'));
      //change constructor
      await driver.tap(
          find.byValueKey('framy_dependency_weightEntry_constructor_dropdown'));
      await driver.tap(find.text('now'));
      //now only weight should be visible
      await driver.waitForAbsent(find.text('dateTime'));
      await driver.waitForAbsent(find.text('note'));
      await driver.waitFor(find.text('weight'));
    });

    test('should allow use changed constructor', () async {
      await driver.tap(find.byValueKey('framy_dependency_weight_input'));
      await driver.enterText('33');
      await driver.waitFor(find.text('33.0'));
    });
  });

  group('HistoryPage', () {
    Future<void> waitForHistoryPageText(String text) {
      return driver.waitFor(find.descendant(
        of: find.byType('HistoryPage'),
        matching: find.text(text),
      ));
    }

    test('should allow to add one weight entry', () async {
      await closeDependenciesPanelAndGoToOtherPage(
        'HistoryPage',
        openDependenciesPanel: true,
      );

      await _scrollToAddButton('weightEntries');
      await driver.tap(find.text('+ Add weightEntries element'));
      await _scrollToAddButton('weightEntries');
      await driver.tap(find.byValueKey('framy_dependency_weight_input'));
      await driver.enterText('78');
      await waitForHistoryPageText('78.0');
    });

    test('should allow to add second weight entry', () async {
      await _scrollToAddButton('weightEntries');
      await driver.tap(find.text('+ Add weightEntries element'));
      await _scrollToAddButton('weightEntries');
      await driver.tap(find.descendant(
        of: find.byValueKey('framy_dependency_List element 2_input'),
        matching: find.byValueKey('framy_dependency_weight_input'),
      ));
      await driver.enterText('79');
      await waitForHistoryPageText('78.0');
      await waitForHistoryPageText('79.0');
    });

    test('should keep the weight value when note is added', () async {
      await driver.tap(find.descendant(
        of: find.byValueKey('framy_dependency_List element 2_input'),
        matching: find.byValueKey('framy_dependency_note_input'),
      ));
      await driver.enterText('Some note');
      await waitForHistoryPageText('78.0');
      await waitForHistoryPageText('79.0');
    });

    test('should allow to change constructor in list', () async {
      //change constructor
      await driver.tap(
        find.byValueKey('framy_dependency_List element 2_constructor_dropdown'),
      );
      await driver.tap(find.text('now'));
      //confirm there is no date
      await driver.waitForAbsent(find.descendant(
        of: find.byValueKey('framy_dependency_List element 2_input'),
        matching: find.text('dateTime'),
      ));
      //change the weight
      await driver.tap(find.descendant(
        of: find.byValueKey('framy_dependency_List element 2_input'),
        matching: find.byValueKey('framy_dependency_weight_input'),
      ));
      await driver.enterText('13');
      //confirm changed weight in UI
      await waitForHistoryPageText('13.0');
    });
  });
}
