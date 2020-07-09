import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:counter_app/main.app.framy.dart';

import 'test_utils.dart';

void main() {
  group('TogglePage', () {
    testWidgets('should build', (tester) async {
      await tester.pumpWidget(FramyAppWrapperWithScaffold(FramyTogglePage()));
      expect(find.byType(FramyTogglePage), findsOneWidget);
    });

    testWidgets('should have Switch', (tester) async {
      await tester.pumpWidget(FramyAppWrapperWithScaffold(FramyTogglePage()));
      expect(find.byType(Switch), findsOneWidget);
    });

    testWidgets('should have ToggleButtons', (tester) async {
      await tester.pumpWidget(FramyAppWrapperWithScaffold(FramyTogglePage()));
      expect(find.byType(ToggleButtons), findsOneWidget);
    });

    testWidgets('should have Checkbox', (tester) async {
      await tester.pumpWidget(FramyAppWrapperWithScaffold(FramyTogglePage()));
      expect(find.byType(Checkbox), findsOneWidget);
    });

    testWidgets('should have Radio buttons', (tester) async {
      await tester.pumpWidget(FramyAppWrapperWithScaffold(FramyTogglePage()));
      expect(find.byType(Radio<String>().runtimeType), findsNWidgets(2));
    });
  });
}
