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
      await tester.pumpWidget(FramyApp());
      expect(find.byKey(Key('FramyColorScheme')), findsNothing);
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

    testWidgets('should show AppBar page on tap in drawer', (tester) async {
      //given
      await tester.pumpWidget(FramyApp());
      expect(find.byKey(Key('FramyAppBarPage')), findsNothing);
      //when
      await _goToMaterialComponentPage(tester, find.text('AppBar'));
      //then
      expect(find.byKey(Key('FramyAppBarPage')), findsOneWidget);
    });

    testWidgets('should show Button page on tap in drawer', (tester) async {
      //given
      await tester.pumpWidget(FramyApp());
      expect(find.byKey(Key('FramyButtonPage')), findsNothing);
      //when
      await _goToMaterialComponentPage(
          tester, find.byKey(Key('MaterialComponentsButtonButton')));
      //then
      expect(find.byKey(Key('FramyButtonPage')), findsOneWidget);
    });
  });
}

Future<void> _goToMaterialComponentPage(
    WidgetTester tester, Finder finder) async {
  await tester.tap(find.byTooltip('Open navigation menu'));
  await tester.pumpAndSettle();
  await tester.tap(find.text('Material components'));
  await tester.pumpAndSettle();
  //when
  await tester.tap(finder);
  await tester.pumpAndSettle();
}
