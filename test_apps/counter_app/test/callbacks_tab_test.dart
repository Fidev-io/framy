import 'package:counter_app/main.app.framy.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_utils.dart';

void main() {
  group('Callbacks tab', () {
    testWidgets('it builds', (tester) async {
      await tester.pumpWidget(FramyAppWrapperWithScaffold(
        FramyCallbacksTab(
          dependencies: [],
        ),
      ));
      expect(find.byType(FramyCallbacksTab), findsOneWidget);
    });

    testWidgets('it shows function calls', (tester) async {
      //given
      final model =
          FramyDependencyModel<Function()>('foo', 'void Function()', null);
      model.value();
      model.value();
      //when
      await tester.pumpWidget(FramyAppWrapperWithScaffold(
        FramyCallbacksTab(
          dependencies: [model],
        ),
      ));
      //then
      expect(find.text('foo'), findsNWidgets(2));
    });

    testWidgets('it rebuilds after added function calls', (tester) async {
      //given
      final model =
          FramyDependencyModel<Function()>('foo', 'void Function()', null);
      await tester.pumpWidget(FramyAppWrapperWithScaffold(
        FramyCallbacksTab(
          dependencies: [model],
        ),
      ));
      //when
      model.value();
      await tester.pump();
      //then
      expectLater(find.text('foo'), findsOneWidget);
    });
  });
}
