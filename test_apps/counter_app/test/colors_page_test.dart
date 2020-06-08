import 'package:counter_app/main.app.framy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ColorsPage', () {
    testWidgets('should build', (tester) async {
      await tester.pumpWidget(_TestColorsPage());
      expect(find.byKey(Key('FramyColorsPage')), findsOneWidget);
    });
  });
}

class _TestColorsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FramyColorsPage(),
    );
  }
}
