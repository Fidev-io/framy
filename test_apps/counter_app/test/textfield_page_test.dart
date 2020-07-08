import 'package:counter_app/main.app.framy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_utils.dart';

void main() {
  group('TextFieldPage', () {
    testWidgets('should build', (tester) async {
      await tester.pumpWidget(FramyAppWrapperWithScaffold(FramyTextFieldPage()));
      expect(find.byType(FramyTextFieldPage), findsOneWidget);
    });

    testWidgets('have 8 textfields', (tester) async {
      await tester.pumpWidget(FramyAppWrapperWithScaffold(FramyTextFieldPage()));
      expect(find.byType(TextField), findsNWidgets(8));
    });
  });
}