import 'package:counter_app/main.app.framy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_utils.dart';

void main() {
  group('FramyButtonPage', () {
    testWidgets('should build', (tester) async {
      await tester.pumpWidget(TestMaterialApp(FramyButtonPage()));
      expect(find.byKey(Key('FramyButtonPage')), findsOneWidget);
    });
  });
}
