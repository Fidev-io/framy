import 'package:counter_app/main.app.framy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Drawer', () {
    testWidgets('should build', (tester) async {
      await tester.pumpWidget(_TestDrawer());
      expect(find.byKey(Key('FramyDrawer')), findsOneWidget);
    });

    testWidgets('should have Typography list item', (tester) async {
      await tester.pumpWidget(_TestDrawer());
      expect(find.text('Typography'), findsOneWidget);
    });
  });
}

class _TestDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FramyDrawer(),
    );
  }
}
