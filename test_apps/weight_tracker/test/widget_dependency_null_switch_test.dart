import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weight_tracker/main.app.framy.dart';
import 'package:weight_tracker/models/user.dart';

import 'test_utils.dart';

void main() {
  group('FramyWidgetDependencyNullSwitch', () {
    testWidgets('should build', (tester) async {
      await tester.pumpWidget(
          TestMaterialAppWithScaffold(FramyWidgetDependencyNullSwitch(
        dependency: FramyDependencyModel(
          'user',
          'User',
          null,
          [],
        ),
      )));
      expect(find.byType(FramyWidgetDependencyNullSwitch), findsOneWidget);
    });

    testWidgets('should be active when dependency.value is null',
        (tester) async {
      //given
      final initialValue = null;
      //when
      await tester.pumpWidget(
          TestMaterialAppWithScaffold(FramyWidgetDependencyNullSwitch(
        dependency: FramyDependencyModel(
          'user',
          'User',
          initialValue,
          [],
        ),
      )));
      //then
      expect(tester.widget<Switch>(find.byType(Switch)).value, isTrue);
    });

    testWidgets('should be inactive when dependency.value is not null',
        (tester) async {
      //given
      final initialValue = User(null, null, null);
      //when
      await tester.pumpWidget(
          TestMaterialAppWithScaffold(FramyWidgetDependencyNullSwitch(
        dependency: FramyDependencyModel(
          'user',
          'User',
          initialValue,
          [],
        ),
      )));
      //then
      expect(tester.widget<Switch>(find.byType(Switch)).value, isFalse);
    });

    testWidgets(
        'should emit null when switch is tapped and dependency.value is not null',
        (tester) async {
      //given
      final initialValue = User(null, null, null);
      dynamic emittedValue = 'foo';
      await tester.pumpWidget(
        TestMaterialAppWithScaffold(
          FramyWidgetDependencyNullSwitch(
            onChanged: (newValue) => emittedValue = newValue,
            dependency: FramyDependencyModel(
              'user',
              'User',
              initialValue,
              [],
            ),
          ),
        ),
      );
      //when
      await tester.tap(find.byType(Switch));
      //then
      expect(emittedValue, isNull);
    });

    testWidgets(
        'should emit non-null value when switch is tapped and value is null',
        (tester) async {
      //given
      dynamic emittedValue;
      final initialValue = null;
      await tester.pumpWidget(
        TestMaterialAppWithScaffold(
          FramyWidgetDependencyNullSwitch(
            onChanged: (newValue) => emittedValue = newValue,
            dependency: FramyDependencyModel(
              'user',
              'User',
              initialValue,
              [
                FramyDependencyModel('firstName', 'String', null, []),
                FramyDependencyModel('lastName', 'String', null, []),
                FramyDependencyModel('age', 'int', null, []),
                FramyDependencyModel('emails', 'List<String>', null, []),
              ],
            ),
          ),
        ),
      );
      //when
      await tester.tap(find.byType(Switch));
      //then
      expect(emittedValue, isNotNull);
    });
  });
}
