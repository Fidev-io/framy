import 'package:counter_app/main.app.framy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FramyFontsPage', () {
    testWidgets('should build', (tester) async {
      await tester.pumpWidget(_TestFontsPage());
      expect(find.byKey(Key('FramyFontsPage')), findsOneWidget);
    });
  });
}

class _TestFontsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FramyFontsPage(),
    );
  }
}
