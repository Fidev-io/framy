import 'package:flutter_test/flutter_test.dart';
import 'package:weight_tracker/main.app.framy.dart';

import 'test_utils.dart';

void main() {
  group('FramyWidgetDependencyNullSwitch', () {
    testWidgets('should build', (tester) async {
      await tester.pumpWidget(TestMaterialApp(FramyWidgetDependencyNullSwitch()));
      expect(find.byType(FramyWidgetDependencyNullSwitch), findsOneWidget);
    });
  });
}