import 'package:flutter_test/flutter_test.dart';
import 'package:weight_tracker/main.app.framy.dart';
import 'package:weight_tracker/models/weight_entry.dart';

import 'test_utils.dart';

void main() {
  FramyDependencyModel _createWeightEntryDependencyModel(
          {String constructor = ''}) =>
      FramyDependencyModel<WeightEntry>(
        'weightEntry',
        'WeightEntry',
        null,
        createSubDependencies('WeightEntry'),
        constructor: constructor,
      );

  group('ConstructorDropdown', () {
    testWidgets('should build', (WidgetTester tester) async {
      //given
      final model = _createWeightEntryDependencyModel();
      //when
      await tester.pumpWidget(FramyAppWrapperWithScaffold(
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
      await tester.pumpWidget(FramyAppWrapperWithScaffold(
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
      await tester.pumpWidget(FramyAppWrapperWithScaffold(
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
      await tester.pumpWidget(FramyAppWrapperWithScaffold(
        FramyConstructorDropdown(dependency: model),
      ));
      //then
      expect(find.text('now'), findsOneWidget);
    });

    testWidgets(
        'should update dependencys constructor and subDependencies on change',
        (WidgetTester tester) async {
      //given
      final model = _createWeightEntryDependencyModel();
      expect(model.constructor, '');
      expect(model.subDependencies, hasLength(3));
      FramyDependencyModel onChangedModel;
      await tester.pumpWidget(FramyAppWrapperWithScaffold(
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
    });
  });
}
