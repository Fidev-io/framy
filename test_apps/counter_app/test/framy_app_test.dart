import 'package:counter_app/main.app.framy.dart';
import 'package:counter_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Framy App', () {
    testWidgets('should build', (tester) async {
      await tester.pumpWidget(FramyApp());
      expect(find.byKey(Key('FramyApp')), findsOneWidget);
    });

    testWidgets('should build fonts page', (tester) async {
      await tester.pumpWidget(FramyApp());
      expect(find.byKey(Key('FramyFontsPage')), findsOneWidget);
    });

    testWidgets('should show ColorsPage on tap in drawer', (tester) async {
      //given
      expect(find.byKey(Key('FramyColorScheme')), findsNothing);
      await tester.pumpWidget(FramyApp());
      await tester.tap(find.byTooltip('Open navigation menu'));
      await tester.pumpAndSettle();
      //when
      await tester.tap(find.text('Color scheme'));
      await tester.pumpAndSettle();
      //then
      expect(find.byKey(Key('FramyColorsPage')), findsOneWidget);
    });

    testWidgets('should use getThemeData', (tester) async {
      //when
      await tester.pumpWidget(FramyApp());
      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      //then
      expect(materialApp.theme, getThemeData());
    });
  });
}
