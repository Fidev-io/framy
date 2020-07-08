import 'package:counter_app/main.app.framy.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_utils.dart';

void main() {
  FramyDependencyModel _getStringModel([String defaultValue]) =>
      FramyDependencyModel<String>('name', 'String', defaultValue, []);

  FramyDependencyModel _getIntModel([int defaultValue]) =>
      FramyDependencyModel<int>('count', 'int', defaultValue, []);

  FramyDependencyModel _getDoubleModel([double defaultValue]) =>
      FramyDependencyModel<double>('dub', 'double', defaultValue, []);

  FramyDependencyModel _getBoolModel([bool defaultValue]) =>
      FramyDependencyModel<bool>('boolVal', 'bool', defaultValue, []);

  Future<void> _buildDependencyInput(
      WidgetTester tester, FramyDependencyModel dependency,
      [ValueChanged<FramyDependencyModel> onChanged]) async {
    await tester.pumpWidget(
      FramyAppWrapperWithScaffold(
        FramyWidgetDependencyInput(
          dependency: dependency,
          onChanged: onChanged ?? (_) {},
          presets: {},
        ),
      ),
    );
  }

  group('FramyWidgetDependencyInput', () {
    testWidgets('should build', (WidgetTester tester) async {
      await _buildDependencyInput(tester, _getStringModel());
      expect(find.byType(FramyWidgetDependencyInput), findsOneWidget);
    });

    testWidgets('should display default value', (WidgetTester tester) async {
      await _buildDependencyInput(tester, _getStringModel('fooDefault'));
      expect(find.text('fooDefault'), findsOneWidget);
    });

    group('for integers', () {
      testWidgets('should emit changed int value when int is typed in',
          (WidgetTester tester) async {
        //given
        var emittedValue;
        await _buildDependencyInput(
          tester,
          _getIntModel(0),
          (dep) => emittedValue = dep.value,
        );
        //when
        await tester.enterText(
            find.byKey(Key('framy_dependency_count_input')), '7');
        //then
        expect(emittedValue, isInstanceOf<int>());
        expect(emittedValue, equals(7));
      });

      testWidgets('should show error message when invalid int is typed in',
          (WidgetTester tester) async {
        //given
        await _buildDependencyInput(tester, _getIntModel(0));
        //when
        await tester.enterText(
            find.byKey(Key('framy_dependency_count_input')), 'abc');
        await tester.pumpAndSettle();
        //then
        expect(find.text('Invalid integer value'), findsOneWidget);
      });

      testWidgets('should not emit invalid int values when such are typed in',
          (WidgetTester tester) async {
        //given
        int emittedValue = -1;
        await _buildDependencyInput(
          tester,
          _getIntModel(-1),
          (dep) => emittedValue = dep.value,
        );
        //when
        await tester.enterText(
            find.byKey(Key('framy_dependency_count_input')), 'abc');
        //then
        expect(emittedValue, -1);
      });
    });

    group('for doubles', () {
      testWidgets('should emit changed double value when double is typed in',
          (WidgetTester tester) async {
        //given
        var emittedValue;
        await _buildDependencyInput(
          tester,
          _getDoubleModel(0),
          (dep) => emittedValue = dep.value,
        );
        //when
        await tester.enterText(
            find.byKey(Key('framy_dependency_dub_input')), '7.3');
        //then
        expect(emittedValue, isInstanceOf<double>());
        expect(emittedValue, equals(7.3));
      });

      testWidgets('should show error message when invalid double is typed in',
          (WidgetTester tester) async {
        //given
        await _buildDependencyInput(tester, _getDoubleModel(0));
        //when
        await tester.enterText(
            find.byKey(Key('framy_dependency_dub_input')), 'abc');
        await tester.pumpAndSettle();
        //then
        expect(find.text('Invalid double value'), findsOneWidget);
      });

      testWidgets(
          'should not emit invalid double values when such are typed in',
          (WidgetTester tester) async {
        //given
        double emittedValue = -1;
        await _buildDependencyInput(
          tester,
          _getDoubleModel(-1),
          (dep) => emittedValue = dep.value,
        );
        //when
        await tester.enterText(
            find.byKey(Key('framy_dependency_dub_input')), 'abc');
        //then
        expect(emittedValue, -1);
      });
    });

    group('for booleans', () {
      testWidgets(
          'should emit changed boolean value when value in dropdown is changed',
          (WidgetTester tester) async {
        //given
        var emittedValue;
        await _buildDependencyInput(
          tester,
          _getBoolModel(false),
          (dep) => emittedValue = dep.value,
        );
        //when
        await tester.tap(find.byKey(Key('framy_dependency_boolVal_input')));
        await tester.pump();
        await tester.tap(find.text('True').first);
        //then
        expect(emittedValue, isInstanceOf<bool>());
        expect(emittedValue, equals(true));
      });
    });
  });
}
