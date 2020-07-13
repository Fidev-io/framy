import 'package:flutter_test/flutter_test.dart';
import 'package:weight_tracker/main.app.framy.dart';

import 'test_utils.dart';

void main() {
  group('FramyDrawer', () {
    testWidgets('should build', (WidgetTester tester) async {
      await tester.pumpWidget(FramyAppWrapper(FramyDrawer()));
      expect(find.byType(FramyDrawer), findsOneWidget);
    });

    testWidgets('should have a Material components group',
        (WidgetTester tester) async {
      await tester.pumpWidget(FramyAppWrapper(FramyDrawer()));
      expect(find.text('Material components'), findsOneWidget);
    });

    testWidgets('should have a Dummy Widgets group',
        (WidgetTester tester) async {
      await tester.pumpWidget(FramyAppWrapper(FramyDrawer()));
      expect(find.text('Dummy Widgets'), findsOneWidget);
    });

    testWidgets(
        'Dummy Widgets group should show two dummy widgets when clicked',
        (WidgetTester tester) async {
      //given
      await tester.pumpWidget(FramyAppWrapper(FramyDrawer()));
      expect(find.text('DummyTestWidget'), findsNothing);
      expect(find.text('BuiltValueExampleWidget'), findsNothing);
      //when
      await tester.tap(find.text('Dummy Widgets'));
      await tester.pump();
      //then
      expect(find.text('DummyTestWidget'), findsOneWidget);
      expect(find.text('BuiltValueExampleWidget'), findsOneWidget);
    });
  });
}
