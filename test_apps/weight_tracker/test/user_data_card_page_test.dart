import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weight_tracker/main.app.framy.dart';

import 'test_utils.dart';

void main() {
  group('UserDataCardPage', () {
    testWidgets('should build', (WidgetTester tester) async {
      await tester.pumpWidget(
          TestMaterialAppWithScaffold(FramyUserDataCardCustomPage()));
      expect(find.byKey(Key('Framy_UserDataCard_Page')), findsOneWidget);
    });
  });
}
