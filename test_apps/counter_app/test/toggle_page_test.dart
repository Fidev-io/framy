import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:counter_app/main.app.framy.dart';

import 'test_utils.dart';

void main() {
  group('TogglePage', () {
    testWidgets('should build', (tester) async {
      await tester.pumpWidget(TestMaterialAppWithScaffold(FramyTogglePage()));
      expect(find.byType(FramyTogglePage), findsOneWidget);
    });

    testWidgets('should have Switch', (tester) async {
      await tester.pumpWidget(TestMaterialAppWithScaffold(FramyTogglePage()));
      expect(find.byType(Switch), findsOneWidget);
    });

    testWidgets('should have ToggleButtons', (tester) async {
      await tester.pumpWidget(TestMaterialAppWithScaffold(FramyTogglePage()));
      expect(find.byType(ToggleButtons), findsOneWidget);
    });
  });
}
