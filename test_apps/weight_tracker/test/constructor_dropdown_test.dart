import 'package:flutter_test/flutter_test.dart';
import 'package:weight_tracker/main.app.framy.dart';
import 'package:weight_tracker/models/weight_entry.dart';

import 'test_utils.dart';

void main() {
  FramyDependencyModel _createWeightEntryDependencyModel(
          {String constructor = '', WeightEntry defaultValue}) =>
      FramyDependencyModel<WeightEntry>(
        'weightEntry',
        'WeightEntry',
        defaultValue,
        constructor: constructor,
      );

  group('ConstructorDropdown', () {
    testWidgets('should build', (WidgetTester tester) async {
      //given
      final model = _createWeightEntryDependencyModel();
      //when
      await tester.pumpWidget(TestMaterialAppWithScaffold(
        FramyConstructorDropdown(dependency: model),
      ));
      //then
      expect(find.byType(FramyConstructorDropdown), findsOneWidget);
    });

    testWidgets('should display Constructor label',
        (WidgetTester tester) async {
      //given
      final model = _createWeightEntryDependencyModel();
      //when
      await tester.pumpWidget(TestMaterialAppWithScaffold(
        FramyConstructorDropdown(dependency: model),
      ));
      //then
      expect(find.text('Constructor'), findsOneWidget);
    });

    testWidgets('should display Default label when constructor is empty',
        (WidgetTester tester) async {
      //given
      final model = _createWeightEntryDependencyModel();
      //when
      await tester.pumpWidget(TestMaterialAppWithScaffold(
        FramyConstructorDropdown(dependency: model),
      ));
      //then
      expect(find.text('Default'), findsOneWidget);
    });

    testWidgets(
        'should display constructor name without dot when constructor is not empty',
        (WidgetTester tester) async {
      //given
      final model = _createWeightEntryDependencyModel(constructor: '.now');
      //when
      await tester.pumpWidget(TestMaterialAppWithScaffold(
        FramyConstructorDropdown(dependency: model),
      ));
      //then
      expect(find.text('now'), findsOneWidget);
    });

    testWidgets(
        'should update dependencies constructor, subDependencies and value on change',
        (WidgetTester tester) async {
      //given
      final model = _createWeightEntryDependencyModel(
        defaultValue: WeightEntry(DateTime.now(), 69, 'note'),
      );
      expect(model.constructor, '');
      expect(model.subDependencies, hasLength(3));
      expect(model.value.weight, 69);
      FramyDependencyModel onChangedModel;
      await tester.pumpWidget(TestMaterialAppWithScaffold(
        FramyConstructorDropdown(
          dependency: model,
          onChanged: (changed) => onChangedModel = changed,
        ),
      ));
      //when
      await tester.tap(find.text('Default'));
      await tester.pump();
      await tester.tap(find.text('now').last);
      //then
      expect(onChangedModel.constructor, '.now');
      expect(onChangedModel.subDependencies, hasLength(1));
      expect(onChangedModel.value.weight, 0);
    });
  });
}
