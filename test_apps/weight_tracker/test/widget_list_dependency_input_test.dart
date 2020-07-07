import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weight_tracker/main.app.framy.dart';
import 'package:weight_tracker/models/weight_entry.dart';

import 'test_utils.dart';

void main() {
  FramyDependencyModel _getStringListModel([List<String> defaultValue]) =>
      FramyDependencyModel<List<String>>(
        'strings',
        'List<String>',
        defaultValue,
        subDependencies: defaultValue == null
            ? []
            : List.generate(
                defaultValue.length,
                (i) => FramyDependencyModel<String>('_', 'String', null),
              ),
      );

  FramyDependencyModel _getWeightEntriesModel([
    List<WeightEntry> defaultValue,
    List<FramyDependencyModel> subDependencies,
  ]) =>
      FramyDependencyModel(
        'weightEntries',
        'List<WeightEntry>',
        defaultValue,
        subDependencies: subDependencies ?? [],
      );

  Future<void> _buildDependencyInput(
    WidgetTester tester,
    FramyDependencyModel dependency, {
    ValueChanged<FramyDependencyModel> onChanged,
    Map<String, Map<String, dynamic>> presets = const {},
  }) async {
    await tester.pumpWidget(
      TestMaterialAppWithScaffold(
        SingleChildScrollView(
          child: FramyWidgetListDependencyInput(
            dependency: dependency,
            onChanged: onChanged ?? (_) {},
            presets: presets,
          ),
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
      expect(find.text('+ Add strings element'), findsOneWidget);
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
      await tester.tap(find.text('+ Add strings element'));
      //then
      expect(emittedValue, hasLength(1));
      expect(emittedValue.first, '');
    });

    testWidgets('should show an input for every list item',
        (WidgetTester tester) async {
      await _buildDependencyInput(
        tester,
        _getStringListModel(['item1', 'item2', 'item3']),
      );
      expect(find.text('item1'), findsOneWidget);
      expect(find.text('item2'), findsOneWidget);
      expect(find.text('item3'), findsOneWidget);
    });

    testWidgets('should emit changed list item value',
        (WidgetTester tester) async {
      //given
      List<String> emittedValue;
      await _buildDependencyInput(
        tester,
        _getStringListModel([null]),
        onChanged: (model) => emittedValue = model.value,
      );
      //when
      await tester.enterText(
          find.byKey(Key('framy_dependency_List element 1_input')), 'Foo foo');
      //then
      expect(emittedValue, hasLength(1));
      expect(emittedValue.first, 'Foo foo');
    });

    testWidgets('should allow to add first item to null and then change it',
        (WidgetTester tester) async {
      //given
      final dependency = _getStringListModel();
      await tester.pumpWidget(
        TestMaterialAppWithScaffold(
          StatefulBuilder(
            builder: (context, setState) => FramyWidgetListDependencyInput(
              dependency: dependency,
              onChanged: (dep) => setState(() {}),
              presets: {},
            ),
          ),
        ),
      );
      //when
      await tester.tap(find.text('+ Add strings element'));
      await tester.pumpAndSettle();
      await tester.enterText(
        find.byKey(Key('framy_dependency_List element 1_input')),
        'Foo foo',
      );
      //then
      expect(dependency.value, hasLength(1));
      expect(dependency.value.first, 'Foo foo');
    });

    testWidgets('should remove element from list when delete icon pressed',
        (WidgetTester tester) async {
      //given
      List<String> emittedValue;
      await _buildDependencyInput(
        tester,
        _getStringListModel(['value1', 'value2']),
        onChanged: (model) => emittedValue = model.value,
      );
      //when
      await tester.tap(find.byKey(
        Key('framy_dependency_List element 1_delete_button'),
      ));
      //then
      expect(emittedValue, hasLength(1));
      expect(emittedValue.first, 'value2');
    });

    testWidgets('should properly update UI after removing element from list',
        (WidgetTester tester) async {
      //given
      final dependency = _getStringListModel(['value1', 'value2']);
      await tester.pumpWidget(
        TestMaterialAppWithScaffold(
          StatefulBuilder(
            builder: (context, setState) => FramyWidgetListDependencyInput(
              dependency: dependency,
              onChanged: (dep) => setState(() {}),
              presets: {},
            ),
          ),
        ),
      );
      //when
      await tester.tap(find.byKey(
        Key('framy_dependency_List element 1_delete_button'),
      ));
      await tester.pump();
      //then
      expect(find.text('value1'), findsNothing);
      expect(find.text('value2'), findsOneWidget);
    });

    group('with custom model', () {
      testWidgets('should build', (WidgetTester tester) async {
        await _buildDependencyInput(tester, _getWeightEntriesModel());
        expect(find.byType(FramyWidgetListDependencyInput), findsOneWidget);
      });

      testWidgets('should display model input when its passed',
          (WidgetTester tester) async {
        //given
        final entry = WeightEntry(DateTime(2020), 90, 'foo');
        final model = FramyDependencyModel<WeightEntry>(
          '_',
          'WeightEntry',
          entry,
          subDependencies: [
            FramyDependencyModel<DateTime>(
                'dateTime', 'DateTime', DateTime(2020)),
            FramyDependencyModel<double>('weight', 'double', 90.0),
            FramyDependencyModel<String>('note', 'String', 'foo'),
          ],
        );
        //when
        await _buildDependencyInput(
          tester,
          _getWeightEntriesModel([entry], [model]),
        );
        //then
        expect(find.text('foo'), findsOneWidget);
        expect(find.text('90.0'), findsOneWidget);
        expect(find.text('2020-01-01 00:00:00'), findsOneWidget);
      });

      testWidgets('should display two model inputs when its passed',
          (WidgetTester tester) async {
        //given
        final entry = WeightEntry(DateTime(2020), 90, 'foo');
        final model = FramyDependencyModel<WeightEntry>(
          '_',
          'WeightEntry',
          entry,
          subDependencies: [
            FramyDependencyModel<DateTime>(
                'dateTime', 'DateTime', DateTime(2020)),
            FramyDependencyModel<double>('weight', 'double', 90.0),
            FramyDependencyModel<String>('note', 'String', 'foo'),
          ],
        );
        //when
        await _buildDependencyInput(
          tester,
          _getWeightEntriesModel([entry, entry], [model, model]),
        );
        //then
        expect(find.text('foo'), findsNWidgets(2));
        expect(find.text('90.0'), findsNWidgets(2));
        expect(find.text('2020-01-01 00:00:00'), findsNWidgets(2));
      });

      testWidgets('should emit new value on Add pressed',
          (WidgetTester tester) async {
        //given
        FramyDependencyModel emittedModel;
        await _buildDependencyInput(
          tester,
          _getWeightEntriesModel(),
          onChanged: (model) => emittedModel = model,
        );
        //when
        await tester.tap(find.text('+ Add weightEntries element'));
        //then
        expect(emittedModel.value, hasLength(1));
        expect(emittedModel.value.first, isNotNull);
      });

      testWidgets(
          'should emit proper values and subDependencies when fields are changed',
          (WidgetTester tester) async {
        //given
        final entry = WeightEntry(DateTime(2020), 90, 'foo');
        final model = FramyDependencyModel<WeightEntry>(
          '_',
          'WeightEntry',
          entry,
          subDependencies: [
            FramyDependencyModel<DateTime>(
                'dateTime', 'DateTime', DateTime(2020)),
            FramyDependencyModel<double>('weight', 'double', 90.0),
            FramyDependencyModel<String>('note', 'String', 'foo'),
          ],
        );
        FramyDependencyModel emittedModel;
        await _buildDependencyInput(
          tester,
          _getWeightEntriesModel([entry], [model]),
          onChanged: (model) => emittedModel = model,
        );

        //when
        await tester.enterText(
            find.byKey(Key('framy_dependency_weight_input')), '89.0');
        await tester.enterText(
            find.byKey(Key('framy_dependency_note_input')), 'FooFoo');

        //then
        expect(emittedModel.value.first.weight, 89.0);
        expect(emittedModel.value.first.note, 'FooFoo');
        expect(emittedModel.subDependencies.first.subDependencies[0].value,
            DateTime(2020));
        expect(
            emittedModel.subDependencies.first.subDependencies[1].value, 89.0);
        expect(emittedModel.subDependencies.first.subDependencies[2].value,
            'FooFoo');
      });
    });
  });
}
