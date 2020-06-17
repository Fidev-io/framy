import 'package:counter_app/main.app.framy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_utils.dart';

void main() {
  group('FramyAppBarPage', () {
    testWidgets('should build', (tester) async {
      await tester.pumpWidget(TestMaterialApp(FramyAppBarPage()));
      expect(find.byKey(Key('FramyAppBarPage')), findsOneWidget);
    });

    testWidgets('should have 4 AppBars', (tester) async {
      await tester.pumpWidget(TestMaterialApp(FramyAppBarPage()));
      expect(find.byType(AppBar), findsNWidgets(4));
    });
  });
}
