import 'package:counter_app/main.app.framy.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_utils.dart';

void main() {
  group('FramyWidgetDependenciesPanel', () {
    testWidgets('should build', (WidgetTester tester) async {
      await tester.pumpWidget(TestMaterialAppWithScaffold(
        FramyWidgetDependenciesPanel(
          dependencies: [],
        ),
      ));
      expect(find.byKey(Key('FramyWidgetDependenciesPanel')), findsOneWidget);
    });

    testWidgets('should display dependency labels for each dependency',
        (WidgetTester tester) async {
      //given
      final dependencies = [
        FramyDependencyModel('name1', FramyDependencyType.string, null),
        FramyDependencyModel('name2', FramyDependencyType.int, null),
      ];
      //when
      await tester.pumpWidget(TestMaterialAppWithScaffold(
        FramyWidgetDependenciesPanel(
          dependencies: dependencies,
        ),
      ));
      //then
      expect(find.text('name1'), findsOneWidget);
      expect(find.text('name2'), findsOneWidget);
    });

    testWidgets('should change string dependency value when typed in input',
        (WidgetTester tester) async {
      //given
      var model = FramyDependencyModel<String>(
          'name1', FramyDependencyType.string, null);
      await tester.pumpWidget(TestMaterialAppWithScaffold(
        FramyWidgetDependenciesPanel(
          dependencies: [model],
          onChanged: (name, val) => model = FramyDependencyModel<String>(
              name, FramyDependencyType.string, val),
        ),
      ));
      //when
      await tester.enterText(
          find.byKey(Key('framy_dependency_name1_input')), 'foo foo');
      //then
      expect(model.name, 'name1');
      expect(model.value, 'foo foo');
    });
  });
}
