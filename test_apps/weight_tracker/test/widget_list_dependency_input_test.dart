import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weight_tracker/main.app.framy.dart';

import 'test_utils.dart';

void main() {
  FramyDependencyModel _getStringListModel([List<String> defaultValue]) =>
      FramyDependencyModel<List<String>>(
          'strings', 'List<String>', defaultValue, []);

  FramyDependencyModel _getTestModel([_TestModel defaultValue]) =>
      FramyDependencyModel<_TestModel>('test', '_TestModel', defaultValue, [
        _getStringListModel(),
      ]);

  Future<void> _buildDependencyInput(
    WidgetTester tester,
    FramyDependencyModel dependency, {
    ValueChanged<FramyDependencyModel> onChanged,
    Map<String, Map<String, dynamic>> presets = const {},
  }) async {
    await tester.pumpWidget(
      TestMaterialAppWithScaffold(
        FramyWidgetListDependencyInput(
          dependency: dependency,
          onChanged: onChanged ?? (_) {},
          presets: presets,
        ),
      ),
    );
  }

  group('FramyWidgetListDependencyInput', () {
    testWidgets('should build', (WidgetTester tester) async {
      await _buildDependencyInput(tester, _getStringListModel());
      expect(find.byType(FramyWidgetListDependencyInput), findsOneWidget);
    });

    testWidgets('should have Add button', (WidgetTester tester) async {
      await _buildDependencyInput(tester, _getStringListModel());
      expect(find.text('Add'), findsOneWidget);
    });

    testWidgets('should add new list element when Add is pressed',
        (WidgetTester tester) async {
      //given
      List<String> emittedValue;
      await _buildDependencyInput(
        tester,
        _getStringListModel(),
        onChanged: (model) => emittedValue = model.value,
      );
      //when
      await tester.tap(find.text('Add'));
      //then
      expect(emittedValue, hasLength(1));
      expect(emittedValue.first, isNull);
    });
  });
}

class _TestModel {
  final List<String> strings;

  _TestModel(this.strings);
}
