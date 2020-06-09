import 'package:counter_app/main.app.framy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ColorsPage', () {
    testWidgets('should build', (tester) async {
      await tester.pumpWidget(_TestColorsPage());
      expect(find.byKey(Key('FramyColorsPage')), findsOneWidget);
    });

    testWidgets('should show color names', (tester) async {
      await tester.pumpWidget(_TestColorsPage());
      expect(find.text('Primary'), findsOneWidget);
      expect(find.text('Primary light'), findsOneWidget);
      expect(find.text('Primary dark'), findsOneWidget);
      expect(find.text('Canvas'), findsOneWidget);
      expect(find.text('Accent'), findsOneWidget);
      expect(find.text('Scaffold background'), findsOneWidget);
      expect(find.text('Bottom appbar'), findsOneWidget);
      expect(find.text('Card'), findsOneWidget);
      expect(find.text('Divider'), findsOneWidget);
      expect(find.text('Focus'), findsOneWidget);
      expect(find.text('Hover'), findsOneWidget);
      expect(find.text('Highlight'), findsOneWidget);
      expect(find.text('Splash'), findsOneWidget);
      expect(find.text('Disabled'), findsOneWidget);
      expect(find.text('Button'), findsOneWidget);
      expect(find.text('Text selection'), findsOneWidget);
      expect(find.text('Cursor'), findsOneWidget);
      expect(find.text('Text selection handle'), findsOneWidget);
      expect(find.text('Background'), findsOneWidget);
      expect(find.text('Dialog background'), findsOneWidget);
      expect(find.text('Indicator'), findsOneWidget);
      expect(find.text('Hint'), findsOneWidget);
      expect(find.text('Error'), findsOneWidget);
      expect(find.text('Toggleable Active'), findsOneWidget);
    });

    testWidgets('should show color values', (tester) async {
      await tester.pumpWidget(_TestColorsPage());
      expect(find.text('#FF2196F3'), findsNWidgets(3));
      expect(find.text('#FFBBDEFB'), findsOneWidget);
      expect(find.text('#FF1976D2'), findsOneWidget);
      expect(find.text('#FFFAFAFA'), findsNWidgets(2));
      expect(find.text('#FFFFFFFF'), findsNWidgets(3));
      expect(find.text('#1F000000'), findsNWidgets(2));
      expect(find.text('#0A000000'), findsOneWidget);
      expect(find.text('#66BCBCBC'), findsOneWidget);
      expect(find.text('#66C8C8C8'), findsOneWidget);
      expect(find.text('#61000000'), findsOneWidget);
      expect(find.text('#FFE0E0E0'), findsOneWidget);
      expect(find.text('#FF64B5F6'), findsOneWidget);
      expect(find.text('#FF4285F4'), findsOneWidget);
      expect(find.text('#FF90CAF9'), findsNWidgets(2));
      expect(find.text('#8A000000'), findsOneWidget);
      expect(find.text('#FFD32F2F'), findsOneWidget);
      expect(find.text('#FF1E88E5'), findsOneWidget);
    });
  });
}

class _TestColorsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FramyColorsPage(),
    );
  }
}
