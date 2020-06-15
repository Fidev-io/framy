import 'package:counter_app/main.app.framy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_utils.dart';

void main() {
  group('Framy_CounterFAB_Page', () {
    testWidgets('should build', (tester) async {
      await tester
          .pumpWidget(TestMaterialAppWithScaffold(FramyCounterFABCustomPage()));
      expect(find.byKey(Key('Framy_CounterFAB_Page')), findsOneWidget);
    });
  });
}
