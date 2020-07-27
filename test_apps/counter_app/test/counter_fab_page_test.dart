import 'package:counter_app/main.app.framy.dart';
import 'package:counter_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_utils.dart';

void main() {
  group('FramyCounterFABCustomPage', () {
    testWidgets('should build', (tester) async {
      await tester.pumpWidget(FramyAppWrapper(FramyCounterFABCustomPage()));
      expect(find.byKey(Key('Framy_CounterFAB_Page')), findsOneWidget);
    });

    testWidgets('should have CounterFAB', (tester) async {
      await tester.pumpWidget(FramyAppWrapper(FramyCounterFABCustomPage()));
      expect(find.byType(CounterFAB), findsOneWidget);
    });

    testWidgets('should show Callbacks page on tap',
        (WidgetTester tester) async {
      //given
      await tester.pumpWidget(FramyAppWrapper(FramyCounterFABCustomPage()));
      //when
      await tester.tap(find.text('Callbacks'));
      await tester.pump();
      //then
      expect(find.byType(FramyCallbacksTab), findsOneWidget);
    });
  });
}
