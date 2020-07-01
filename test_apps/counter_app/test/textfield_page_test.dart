import 'package:counter_app/main.app.framy.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_utils.dart';

void main() {
  group('TextFieldPage', () {
    testWidgets('should build', (tester) async {
      await tester.pumpWidget(TestMaterialAppWithScaffold(FramyTextFieldPage()));
      expect(find.byType(FramyTextFieldPage), findsOneWidget);
    });
  });
}