import 'package:flutter_test/flutter_test.dart';
import 'package:weight_tracker/main.app.framy.dart';

import 'test_utils.dart';

void main() {
  FramyDependencyModel _getTestModel([_TestModel defaultValue]) =>
      FramyDependencyModel<_TestModel>('test', '_TestModel', defaultValue, [
        FramyDependencyModel<List<String>>('strings', 'List<String>', null, []),
      ]);

  Future<void> _buildDependencyInput(
    WidgetTester tester,
    FramyDependencyModel dependency, {
    Function(String, dynamic) onChanged,
    Map<String, Map<String, dynamic>> presets = const {},
  }) async {
    await tester.pumpWidget(
      TestMaterialAppWithScaffold(
        FramyWidgetListDependencyInput(
//          dependency: dependency,
//          onChanged: onChanged ?? (_, __) {},
//          presets: presets,
            ),
      ),
    );
  }

  group('FramyWidgetListDependencyInput', () {
    testWidgets('should build', (WidgetTester tester) async {
      await _buildDependencyInput(tester, _getTestModel());
      expect(find.byType(FramyWidgetListDependencyInput), findsOneWidget);
    });

    testWidgets('should have Add button', (WidgetTester tester) async {
      await _buildDependencyInput(tester, _getTestModel());
      expect(find.text('Add'), findsOneWidget);
    });
  });
}

class _TestModel {
  final List<String> strings;

  _TestModel(this.strings);
}
