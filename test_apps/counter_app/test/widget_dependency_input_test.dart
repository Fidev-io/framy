import 'package:counter_app/main.app.framy.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_utils.dart';

void main() {
  FramyDependencyModel _getStringModel([String defaultValue]) =>
      FramyDependencyModel<String>(
          'name', FramyDependencyType.string, defaultValue);

  FramyDependencyModel _getIntModel([int defaultValue]) =>
      FramyDependencyModel<int>('count', FramyDependencyType.int, defaultValue);

  FramyDependencyModel _getDoubleModel([double defaultValue]) =>
      FramyDependencyModel<double>(
          'dub', FramyDependencyType.double, defaultValue);

  Future<void> _buildDependencyInput(
      WidgetTester tester, FramyDependencyModel dependency,
      [Function(String, dynamic) onChanged]) async {
    await tester.pumpWidget(
      TestMaterialAppWithScaffold(
        FramyWidgetDependencyInput(
          dependency: dependency,
          onChanged: onChanged ?? (_, __) {},
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
          (name, val) => emittedValue = val,
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
          (name, val) => emittedValue = val,
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
          (name, val) => emittedValue = val,
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
          (name, val) => emittedValue = val,
        );
        //when
        await tester.enterText(
            find.byKey(Key('framy_dependency_dub_input')), 'abc');
        //then
        expect(emittedValue, -1);
      });
    });
  });
}
