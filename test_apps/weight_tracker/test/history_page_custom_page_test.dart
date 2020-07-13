import 'package:flutter_test/flutter_test.dart';
import 'package:weight_tracker/main.app.framy.dart';

import 'test_utils.dart';

void main() {
  group('HistoryPageCustomPage', () {
    testWidgets('should build', (WidgetTester tester) async {
      await tester.pumpWidget(
          FramyAppWrapperWithScaffold(FramyHistoryPageCustomPage()));
      expect(find.byType(FramyHistoryPageCustomPage), findsOneWidget);
    });

    testWidgets('should allow to change dependency passed by riverpod',
        (WidgetTester tester) async {
      //given
      await tester.pumpWidget(
          FramyAppWrapperWithScaffold(FramyHistoryPageCustomPage()));
      expect(find.text('No entries'), findsOneWidget);
      //when
      await tester.tap(find.text('+ Add weightEntries element'));
      await tester.pump();
      //expect
      expect(find.text('No entries'), findsNothing);
    });
  });
}
