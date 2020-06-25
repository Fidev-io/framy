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

    Future<void> selectInDropdown(
      WidgetTester tester,
      String text,
      String fieldName,
    ) async {
      await tester.tap(find.byKey(Key('framy_${fieldName}_preset_dropdown')));
      await tester.pump();
      await tester.tap(find.text(text).last);
      await tester.pump();
    }

    testWidgets(
        'should use empty string when dependency is changed to be not null',
        (WidgetTester tester) async {
      //given
      await tester.pumpWidget(
          TestMaterialAppWithScaffold(FramyUserDataCardCustomPage()));
      expect(find.text('null null'), findsOneWidget);
      //when
      await selectInDropdown(tester, 'Custom', 'firstName');
      //then
      expect(find.text(' null'), findsOneWidget);
    });

    testWidgets(
        'should use 0 when int dependency is changed to be not null',
            (WidgetTester tester) async {
          //given
          await tester.pumpWidget(
              TestMaterialAppWithScaffold(FramyUserDataCardCustomPage()));
          expect(find.text('Age: null'), findsOneWidget);
          //when
          await selectInDropdown(tester, 'Custom', 'age');
          //then
          expect(find.text('Age: 0'), findsOneWidget);
        });

    testWidgets('should show previous non-null value for int dependency',
        (WidgetTester tester) async {
      //given
      await tester.pumpWidget(
          TestMaterialAppWithScaffold(FramyUserDataCardCustomPage()));
      //when
      //enter text in age input
      await tester.enterText(
          find.byKey(Key('framy_dependency_age_input')), '25');
      await tester.pump();
      expect(find.text('Age: 25'), findsOneWidget);
      //set age to null
      await selectInDropdown(tester, 'Null', 'age');
      expect(find.text('Age: null'), findsOneWidget);
      //set age to not null
      await selectInDropdown(tester, 'Custom', 'age');
      //then
      expect(find.text('Age: 25'), findsOneWidget);
    });

    testWidgets(
        'should show previous non-null subDependencies values for User dependency',
        (WidgetTester tester) async {
      //given
      await tester.pumpWidget(
          TestMaterialAppWithScaffold(FramyUserDataCardCustomPage()));
      //when
      //enter text in age input
      await tester.enterText(
          find.byKey(Key('framy_dependency_age_input')), '25');
      await tester.pump();
      expect(find.text('Age: 25'), findsOneWidget);
      //set user to null
      await selectInDropdown(tester, 'Null', 'user');
      expect(find.text('Age: null'), findsOneWidget);
      //set user to not null and restore subDependencies not null values
      await selectInDropdown(tester, 'Custom', 'user');
      //then
      expect(find.text('Age: 25'), findsOneWidget);
    });
  });
}
