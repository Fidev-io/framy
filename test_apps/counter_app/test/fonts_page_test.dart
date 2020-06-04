import 'package:counter_app/main.app.framy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FramyFontsPage', () {
    testWidgets('should build', (tester) async {
      await tester.pumpWidget(_TestFontsPage());
      expect(find.byKey(Key('FramyFontsPage')), findsOneWidget);
    });

    testWidgets('should show all font names', (tester) async {
      await tester.pumpWidget(_TestFontsPage());
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
