import 'package:counter_app/main.app.framy.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_utils.dart';

void main() {
  group('FramyWidgetDependencyInput', () {
    testWidgets('should build', (WidgetTester tester) async {
      await tester.pumpWidget(
        TestMaterialAppWithScaffold(
          FramyWidgetDependencyInput(
            dependency: FramyDependencyModel<String>(
                'name', FramyDependencyType.string, null),
          ),
        ),
      );
      expect(find.byType(FramyWidgetDependencyInput), findsOneWidget);
    });

    testWidgets('should display default value', (WidgetTester tester) async {
      await tester.pumpWidget(
        TestMaterialAppWithScaffold(
          FramyWidgetDependencyInput(
            dependency: FramyDependencyModel<String>(
                'name', FramyDependencyType.string, 'fooDefault'),
          ),
        ),
      );
      expect(find.text('fooDefault'), findsOneWidget);
    });
  });
}
