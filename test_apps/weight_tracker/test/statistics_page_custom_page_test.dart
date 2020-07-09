import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weight_tracker/main.app.framy.dart';

import 'test_utils.dart';

void main() {
  group('StatisticsPageCustomPage', () {
    testWidgets('should build', (WidgetTester tester) async {
      await tester.pumpWidget(
          FramyAppWrapperWithScaffold(FramyStatisticsPageCustomPage()));
      expect(find.byType(FramyStatisticsPageCustomPage), findsOneWidget);
    });

    testWidgets(
        'should show circular progress indicator after change to loading',
        (WidgetTester tester) async {
      //given
      await tester.pumpWidget(
          FramyAppWrapperWithScaffold(FramyStatisticsPageCustomPage()));
      //when
      await tester.tap(find.text('loaded'));
      await tester.pump();
      await tester.tap(find.text('loading').last);
      await tester.pump();
      //expect
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
