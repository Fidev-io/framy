import 'package:counter_app/main.app.framy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_utils.dart';

void main() {
  group('Drawer', () {
    testWidgets('should build', (tester) async {
      await tester.pumpWidget(TestMaterialApp(FramyDrawer()));
      expect(find.byKey(Key('FramyDrawer')), findsOneWidget);
    });

    testWidgets('should have Typography list item', (tester) async {
      await tester.pumpWidget(TestMaterialApp(FramyDrawer()));
      expect(find.text('Typography'), findsOneWidget);
    });

    testWidgets('should have Color scheme list item', (tester) async {
      await tester.pumpWidget(TestMaterialApp(FramyDrawer()));
      expect(find.text('Color scheme'), findsOneWidget);
    });

    group('Material components', () {
      Future<void> openMaterialComponentsMenu(WidgetTester tester) async {
        //given
        await tester.pumpWidget(TestMaterialApp(FramyDrawer()));
        //when
        await tester.tap(find.text('Material components'));
        await tester.pump();
      }

      testWidgets('should have AppBar list item', (tester) async {
        await openMaterialComponentsMenu(tester);
        expect(find.text('AppBar'), findsOneWidget);
      });

      testWidgets('should have Button list item', (tester) async {
        await openMaterialComponentsMenu(tester);
        expect(find.text('Button'), findsOneWidget);
      });

      testWidgets('should have Toggle list item', (tester) async {
        await openMaterialComponentsMenu(tester);
        expect(find.text('Toggle'), findsOneWidget);
      });

      testWidgets('should have TextField list item', (tester) async {
        await openMaterialComponentsMenu(tester);
        expect(find.text('TextField'), findsOneWidget);
      });
    });

    testWidgets('should have CounterFAB', (tester) async {
      await tester.pumpWidget(TestMaterialApp(FramyDrawer()));
      expect(find.text('CounterFAB'), findsOneWidget);
    });
  });
}
