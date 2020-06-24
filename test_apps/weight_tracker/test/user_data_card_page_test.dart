import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weight_tracker/main.app.framy.dart';

import 'test_utils.dart';

void main() {
  group('UserDataCardPage', () {
    testWidgets('should build', (WidgetTester tester) async {
      await tester.pumpWidget(
          TestMaterialAppWithScaffold(FramyUserDataCardCustomPage()));
      expect(find.byKey(Key('Framy_UserDataCard_Page')), findsOneWidget);
    });

    testWidgets(
        'should all subdependencies switches be set to null state when user is set to null',
        (WidgetTester tester) async {
      //given
      final userSwitchKey = Key('framy_dependency_user_null_switch');
      final firstNameSwitchKey = Key('framy_dependency_firstName_null_switch');
      await tester.pumpWidget(
          TestMaterialAppWithScaffold(FramyUserDataCardCustomPage()));
      await tester.enterText(
          find.byKey(Key('framy_dependency_firstName_input')), 'John');
      await tester.pump();
      expect(
        tester.widget<Switch>(find.byKey(firstNameSwitchKey)).value,
        isTrue,
      );
      //when
      await tester.tap(find.byKey(userSwitchKey));
      await tester.pump();
      //then
      expect(tester.widget<Switch>(find.byKey(userSwitchKey)).value, isFalse);
      expect(
        tester.widget<Switch>(find.byKey(firstNameSwitchKey)).value,
        isFalse,
      );
    });
  });
}
