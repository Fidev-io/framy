import 'package:counter_app/main.app.framy.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_utils.dart';

void main() {
  group('FramyFontsPage', () {
    testWidgets('should build', (tester) async {
      await tester.pumpWidget(TestMaterialApp(FramyFontsPage()));
      expect(find.byKey(Key('FramyFontsPage')), findsOneWidget);
    });

    testWidgets('should show all font names', (tester) async {
      await tester.pumpWidget(TestMaterialApp(FramyFontsPage()));
      expect(find.text('Headline1'), findsOneWidget);
      expect(find.text('Headline2'), findsOneWidget);
      expect(find.text('Headline3'), findsOneWidget);
      expect(find.text('Headline4'), findsOneWidget);
      expect(find.text('Headline5'), findsOneWidget);
      expect(find.text('Headline6'), findsOneWidget);
      expect(find.text('Subtitle1'), findsOneWidget);
      expect(find.text('Subtitle2'), findsOneWidget);
      expect(find.text('BodyText1'), findsOneWidget);
      expect(find.text('BodyText2'), findsOneWidget);
      expect(find.text('Caption'), findsOneWidget);
      expect(find.text('Button'), findsOneWidget);
      expect(find.text('Overline'), findsOneWidget);
    });

    void testMatchingStyle(String label, TextStyle style, WidgetTester tester) {
      final usedTextStyle = tester.widget<Text>(find.text(label)).style;
      expect(usedTextStyle, style);
    }

    testWidgets('should use proper font styles for font names', (tester) async {
      TextTheme textTheme;
      await tester.pumpWidget(MaterialApp(
        home: Builder(
          builder: (context) {
            textTheme = Theme.of(context).textTheme;
            return FramyFontsPage();
          },
        ),
      ));
      testMatchingStyle('Headline1', textTheme.headline1, tester);
      testMatchingStyle('Headline2', textTheme.headline2, tester);
      testMatchingStyle('Headline3', textTheme.headline3, tester);
      testMatchingStyle('Headline4', textTheme.headline4, tester);
      testMatchingStyle('Headline5', textTheme.headline5, tester);
      testMatchingStyle('Headline6', textTheme.headline6, tester);
      testMatchingStyle('Subtitle1', textTheme.subtitle1, tester);
      testMatchingStyle('Subtitle2', textTheme.subtitle2, tester);
      testMatchingStyle('BodyText1', textTheme.bodyText1, tester);
      testMatchingStyle('BodyText2', textTheme.bodyText2, tester);
      testMatchingStyle('Caption', textTheme.caption, tester);
      testMatchingStyle('Button', textTheme.button, tester);
      testMatchingStyle('Overline', textTheme.overline, tester);
    });

    testWidgets('macOS should display styles descriptions', (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
      await tester.pumpWidget(TestMaterialApp(FramyFontsPage()));
      expect(
          find.text(
              '.SF UI Display / size: 112.0 / weight: w100 / color: #8A000000'),
          findsOneWidget);
      expect(
          find.text(
              '.SF UI Display / size: 56.0 / weight: w400 / color: #8A000000'),
          findsOneWidget);
      expect(
          find.text(
              '.SF UI Display / size: 45.0 / weight: w400 / color: #8A000000'),
          findsOneWidget);
      expect(
          find.text(
              '.SF UI Display / size: 34.0 / weight: w400 / color: #8A000000'),
          findsOneWidget);
      expect(
          find.text(
              '.SF UI Display / size: 24.0 / weight: w400 / color: #DD000000'),
          findsOneWidget);
      expect(
          find.text(
              '.SF UI Display / size: 20.0 / weight: w500 / color: #DD000000'),
          findsOneWidget);
      expect(
          find.text(
              '.SF UI Text / size: 16.0 / weight: w400 / color: #DD000000'),
          findsOneWidget);
      expect(
          find.text(
              '.SF UI Text / size: 14.0 / weight: w500 / color: #FF000000 / letter spacing: 0.1'),
          findsOneWidget);
      expect(
          find.text(
              '.SF UI Text / size: 14.0 / weight: w500 / color: #DD000000'),
          findsNWidgets(2));
      expect(
          find.text(
              '.SF UI Text / size: 14.0 / weight: w400 / color: #DD000000'),
          findsOneWidget);
      expect(
          find.text(
              '.SF UI Text / size: 12.0 / weight: w400 / color: #8A000000'),
          findsOneWidget);
      expect(
          find.text(
              '.SF UI Text / size: 10.0 / weight: w400 / color: #FF000000 / letter spacing: 1.5'),
          findsOneWidget);
      debugDefaultTargetPlatformOverride = null;
    });
  });
}
