import 'package:counter_app/main.app.framy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Framy App', () {
    testWidgets('should build', (tester) async {
      await tester.pumpWidget(FramyApp());
      expect(find.byType(FramyApp), findsOneWidget);
    });

    testWidgets('should have an app bar', (tester) async {
      await tester.pumpWidget(FramyApp());
      expect(find.byKey(Key('FramyAppBar')), findsOneWidget);
    });

    testWidgets('should have fonts page', (tester) async {
      await tester.pumpWidget(FramyApp());
      expect(find.byKey(Key('FramyFontsPage')), findsOneWidget);
    });

    testWidgets('should have an openable drawer', (tester) async {
      //given
      await tester.pumpWidget(FramyApp());
      expect(find.byKey(Key('FramyDrawer')), findsNothing);
      //when
      await tester.tap(find.byTooltip('Open navigation menu'));
      await tester.pump();
      //then
      expect(find.byKey(Key('FramyDrawer')), findsOneWidget);
    });
  });
}
