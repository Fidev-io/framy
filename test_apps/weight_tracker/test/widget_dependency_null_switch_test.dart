import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weight_tracker/main.app.framy.dart';

import 'test_utils.dart';

void main() {
  group('FramyWidgetDependencyNullSwitch', () {
    testWidgets('should build', (tester) async {
      await tester.pumpWidget(TestMaterialAppWithScaffold(
          FramyWidgetDependencyNullSwitch(value: null)));
      expect(find.byType(FramyWidgetDependencyNullSwitch), findsOneWidget);
    });

    testWidgets('should be active when passed value is null', (tester) async {
      await tester.pumpWidget(
          TestMaterialAppWithScaffold(FramyWidgetDependencyNullSwitch(
        value: null,
      )));
      expect(tester.widget<Switch>(find.byType(Switch)).value, isTrue);
    });

    testWidgets('should be inactive when passed value is not null', (tester) async {
      await tester.pumpWidget(
          TestMaterialAppWithScaffold(FramyWidgetDependencyNullSwitch(
            value: true,
          )));
      expect(tester.widget<Switch>(find.byType(Switch)).value, isFalse);
    });
  });
}
