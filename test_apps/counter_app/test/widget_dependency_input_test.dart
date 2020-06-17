import 'package:counter_app/main.app.framy.dart';
import 'package:flutter/foundation.dart';
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

    testWidgets('should emit changed int value when int is typed in',
        (WidgetTester tester) async {
      //given
      var emittedValue;
      await tester.pumpWidget(
        TestMaterialAppWithScaffold(
          FramyWidgetDependencyInput(
            dependency:
                FramyDependencyModel<int>('name', FramyDependencyType.int, 0),
            onChanged: (name, val) => emittedValue = val,
          ),
        ),
      );
      //when
      await tester.enterText(
          find.byKey(Key('framy_dependency_name_input')), '7');
      //then
      expect(emittedValue, isInstanceOf<int>());
      expect(emittedValue, equals(7));
    });

    testWidgets('should show error message when invalid int is typed in',
        (WidgetTester tester) async {
      //given
      await tester.pumpWidget(
        TestMaterialAppWithScaffold(
          FramyWidgetDependencyInput(
            dependency:
                FramyDependencyModel<int>('name', FramyDependencyType.int, 0),
            onChanged: (_, __) {},
          ),
        ),
      );
      //when
      await tester.enterText(
          find.byKey(Key('framy_dependency_name_input')), 'abc');
      await tester.pumpAndSettle();
      //then
      expect(find.text('Invalid integer value'), findsOneWidget);
    });

    testWidgets('should not emit invalid int values when such are typed in',
        (WidgetTester tester) async {
      //given
      int emittedValue = -1; //default val
      await tester.pumpWidget(
        TestMaterialAppWithScaffold(
          FramyWidgetDependencyInput(
            dependency:
                FramyDependencyModel<int>('name', FramyDependencyType.int, -1),
            onChanged: (_, val) => emittedValue = val,
          ),
        ),
      );
      //when
      await tester.enterText(
          find.byKey(Key('framy_dependency_name_input')), 'abc');
      //then
      expect(emittedValue, -1);
    });
  });
}
