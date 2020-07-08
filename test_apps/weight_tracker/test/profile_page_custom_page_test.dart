import 'package:flutter_test/flutter_test.dart';
import 'package:weight_tracker/main.app.framy.dart';

import 'test_utils.dart';

void main() {
  group('FramyProfilePageCustomPage', () {
    testWidgets('should build', (WidgetTester tester) async {
      await tester.pumpWidget(
        FramyAppWrapperWithScaffold(FramyProfilePageCustomPage()),
      );
      expect(find.byType(FramyProfilePageCustomPage), findsOneWidget);
    });
  });
}
