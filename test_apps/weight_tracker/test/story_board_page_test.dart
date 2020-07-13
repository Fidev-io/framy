import 'package:flutter_test/flutter_test.dart';
import 'package:weight_tracker/main.app.framy.dart';
import 'package:weight_tracker/pages/history_page.dart';
import 'package:weight_tracker/pages/profile_page.dart';
import 'package:weight_tracker/pages/statistics_page.dart';

import 'test_utils.dart';

void main() {
  group('StoryBoardPage', () {
    testWidgets('should build', (WidgetTester tester) async {
      await tester.pumpWidget(
        FramyAppWrapperWithScaffold(FramyStoryBoardPage()),
      );
      expect(find.byType(FramyStoryBoardPage), findsOneWidget);
    });

    testWidgets('should have proper pages', (WidgetTester tester) async {
      await tester.pumpWidget(
        FramyAppWrapperWithScaffold(FramyStoryBoardPage()),
      );
      expect(find.byType(StatisticsPage), findsOneWidget);
      expect(find.byType(ProfilePage), findsOneWidget);
      expect(find.byType(HistoryPage), findsOneWidget);
    });
  });
}
