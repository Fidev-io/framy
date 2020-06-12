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

    testWidgets('should have Color scheme list item', (tester) async {
      await tester.pumpWidget(_TestDrawer());
      expect(find.text('Color scheme'), findsOneWidget);
    });

    group('Material components', () {
      Future<void> openDrawer(WidgetTester tester) async {
        //given
        await tester.pumpWidget(_TestDrawer());
        //when
        await tester.tap(find.text('Material components'));
        await tester.pump();
      }

      testWidgets('should have AppBar list item', (tester) async {
        await openDrawer(tester);
        expect(find.text('AppBar'), findsOneWidget);
      });

      testWidgets('should have Button list item', (tester) async {
        await openDrawer(tester);
        expect(find.text('Button'), findsOneWidget);
      });
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
