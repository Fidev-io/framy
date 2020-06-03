import 'package:counter_app/main.app.framy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppBar', () {
    testWidgets('should build', (tester) async {
      await tester.pumpWidget(_TestAppBar());
      expect(find.byKey(Key('FramyAppBar')), findsOneWidget);
    });

    testWidgets('should have title', (tester) async {
      await tester.pumpWidget(_TestAppBar());
      expect(find.text('Framy App'), findsOneWidget);
    });
  });
}

class _TestAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FramyAppBar(),
    );
  }
}
