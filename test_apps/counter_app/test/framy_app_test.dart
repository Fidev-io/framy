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
      await _openDrawer(tester);
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

    testWidgets('should show Toggle page on tap in drawer', (tester) async {
      //given
      await tester.pumpWidget(FramyApp());
      expect(find.byKey(Key('FramyTogglePage')), findsNothing);
      //when
      await _goToMaterialComponentPage(tester, find.text('Toggle'));
      //then
      expect(find.byKey(Key('FramyTogglePage')), findsOneWidget);
    });

    testWidgets('should show TextField page on tap in drawer', (tester) async {
      //given
      await tester.pumpWidget(FramyApp());
      expect(find.byKey(Key('FramyTextFieldPage')), findsNothing);
      //when
      await _goToMaterialComponentPage(tester, find.text('TextField'));
      //then
      expect(find.byKey(Key('FramyTextFieldPage')), findsOneWidget);
    });

    testWidgets('should show CounterFAB page on tap in drawer', (tester) async {
      //given
      await tester.pumpWidget(FramyApp());
      expect(find.byKey(Key('Framy_CounterFAB_Page')), findsNothing);
      await _openDrawer(tester);
      //when
      await tester.tap(find.text('CounterFAB'));
      await tester.pumpAndSettle();
      //then
      expect(find.byKey(Key('Framy_CounterFAB_Page')), findsOneWidget);
    });

    group('Settings dialog', () {
      Future<void> goToCounterFabPage(WidgetTester tester) async {
        await tester.pumpWidget(FramyApp(key: framyAppStateKey));
        await _openDrawer(tester);
        await tester.tap(find.text('CounterFAB'));
        await tester.pumpAndSettle();
      }

      testWidgets('should wrap widget with Scaffold when Scaffold switch is on',
          (tester) async {
        //given
        await goToCounterFabPage(tester);
        //then
        expect(find.byKey(Key('FramyGeneratedScaffold')), findsOneWidget);
      });

      testWidgets(
          'should not wrap widget with Scaffold when Scaffold switch is off',
          (tester) async {
        //given
        await goToCounterFabPage(tester);
        //when
        await tester.tap(find.byKey(ValueKey('FramyAppBarSettingsButton')));
        await tester.pump();
        await tester.tap(find.byKey(ValueKey('FramyAppScaffoldSwitch')));
        await tester.pumpAndSettle();
        //then
        expect(find.byKey(Key('FramyGeneratedScaffold')), findsNothing);
      });

      testWidgets(
          'should not wrap widget with Center when Center switch is off',
          (tester) async {
        //given
        await goToCounterFabPage(tester);
        //then
        expect(find.byKey(Key('FramyGeneratedCenter')), findsNothing);
      });

      testWidgets('should wrap widget with Center when Center switch is on',
          (tester) async {
        //given
        await goToCounterFabPage(tester);
        //when
        await tester.tap(find.byKey(ValueKey('FramyAppBarSettingsButton')));
        await tester.pump();
        await tester.tap(find.byKey(ValueKey('FramyAppCenterSwitch')));
        await tester.pump();
        //then
        expect(find.byKey(Key('FramyGeneratedCenter')), findsOneWidget);
      });

      testWidgets(
          'should not wrap widget with SafeArea when SafeArea switch is off',
          (tester) async {
        //given
        await goToCounterFabPage(tester);
        //then
        expect(find.byKey(Key('FramyGeneratedSafeArea')), findsNothing);
      });

      testWidgets('should wrap widget with SafeArea when SafeArea switch is on',
          (tester) async {
        //given
        await goToCounterFabPage(tester);
        //when
        await tester.tap(find.byKey(ValueKey('FramyAppBarSettingsButton')));
        await tester.pump();
        await tester.tap(find.byKey(ValueKey('FramyAppSafeAreaSwitch')));
        await tester.pump();
        //then
        expect(find.byKey(Key('FramyGeneratedSafeArea')), findsOneWidget);
      });
    });
  });
}

Future<void> _openDrawer(WidgetTester tester) async {
  await tester.tap(find.byTooltip('Open navigation menu'));
  await tester.pumpAndSettle();
}

Future<void> _goToMaterialComponentPage(
    WidgetTester tester, Finder finder) async {
  await _openDrawer(tester);
  await tester.tap(find.text('Material components'));
  await tester.pumpAndSettle();
  //when
  await tester.tap(finder);
  await tester.pumpAndSettle();
}
