import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weight_tracker/main.app.framy.dart';

import 'test_utils.dart';

void main() {
  group('BuiltValueExampleWidget', () {
    testWidgets('should build', (WidgetTester tester) async {
      await tester.pumpWidget(
          FramyAppWrapper(FramyBuiltValueExampleWidgetCustomPage()));
      expect(
          find.byType(FramyBuiltValueExampleWidgetCustomPage), findsOneWidget);
    });

    testWidgets('should allow to change fields from model',
        (WidgetTester tester) async {
      //given
      await tester.pumpWidget(
          FramyAppWrapper(FramyBuiltValueExampleWidgetCustomPage()));
      //when
      await tester.enterText(
          find.byKey(Key('framy_dependency_firstName_input')), 'Adam');
      await tester.enterText(
          find.byKey(Key('framy_dependency_lastName_input')), 'Mickiewicz');
      await tester.pump();
      //then
      expect(find.text('Adam\nMickiewicz'), findsOneWidget);
    });
  });
}
