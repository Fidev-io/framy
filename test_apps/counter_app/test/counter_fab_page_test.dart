import 'package:counter_app/main.app.framy.dart';
import 'package:counter_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_utils.dart';

void main() {
  group('FramyCounterFABCustomPage', () {
    testWidgets('should build', (tester) async {
      await tester.pumpWidget(TestMaterialApp(FramyCounterFABCustomPage()));
      expect(find.byKey(Key('Framy_CounterFAB_Page')), findsOneWidget);
    });

    testWidgets('should have CounterFAB', (tester) async {
      await tester.pumpWidget(TestMaterialApp(FramyCounterFABCustomPage()));
      expect(find.byType(CounterFAB), findsOneWidget);
    });
  });
}
