import 'package:flutter_test/flutter_test.dart';
import 'package:counter_app/main.app.framy.dart';

import 'test_utils.dart';

void main() {
  group('TogglePage', () {

    testWidgets('should build', (tester) async {
      await tester.pumpWidget(TestMaterialAppWithScaffold(FramyTogglePage()));
      expect(find.byType(FramyTogglePage), findsOneWidget);
    });
  });
}
