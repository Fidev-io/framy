import 'package:flutter_test/flutter_test.dart';
import 'package:weight_tracker/main.app.framy.dart';

import 'test_utils.dart';

void main() {
  group('FramyDummyTestWidgetCustomPage', () {
    testWidgets('should build', (WidgetTester tester) async {
      await tester.pumpWidget(
        FramyAppWrapperWithScaffold(FramyDummyTestWidgetCustomPage()),
      );
      expect(find.byType(FramyDummyTestWidgetCustomPage), findsOneWidget);
    });

    testWidgets('should display \'Not supported type\' text',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        FramyAppWrapperWithScaffold(FramyDummyTestWidgetCustomPage()),
      );
      expect(find.text('Not supported type'), findsOneWidget);
    });
  });
}
