import 'package:counter_app/main.app.framy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_utils.dart';

void main() {
  group('ColorsPage', () {
    testWidgets('should build', (tester) async {
      await tester.pumpWidget(FramyAppWrapper(FramyColorsPage()));
      expect(find.byKey(Key('FramyColorsPage')), findsOneWidget);
    });

    testWidgets('should show color names', (tester) async {
      await tester.pumpWidget(FramyAppWrapper(FramyColorsPage()));
      await tester.dragFrom(Offset(0, 500), Offset(0, -100));
      await tester.pump();
      expect(find.text('Primary'), findsNWidgets(2));
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
      expect(find.text('Background'), findsNWidgets(2));
      expect(find.text('Dialog background'), findsOneWidget);
      expect(find.text('Indicator'), findsOneWidget);
      expect(find.text('Hint'), findsOneWidget);
      expect(find.text('Error'), findsNWidgets(2));
      expect(find.text('Toggleable Active'), findsOneWidget);
      expect(find.text('Primary variant'), findsOneWidget);
      expect(find.text('Secondary'), findsOneWidget);
      expect(find.text('Secondary variant'), findsOneWidget);
      expect(find.text('Surface'), findsOneWidget);
      expect(find.text('On primary'), findsOneWidget);
      expect(find.text('On secondary'), findsOneWidget);
      expect(find.text('On background'), findsOneWidget);
      expect(find.text('On surface'), findsOneWidget);
      expect(find.text('On error'), findsOneWidget);
    });

    testWidgets('should show color values', (tester) async {
      await tester.pumpWidget(FramyAppWrapper(FramyColorsPage()));
      await tester.dragFrom(Offset(0, 500), Offset(0, -100));
      await tester.pump();
      expect(find.text('#FF2196F3'), findsNWidgets(5));
      expect(find.text('#FFBBDEFB'), findsOneWidget);
      expect(find.text('#FF1976D2'), findsNWidgets(3));
      expect(find.text('#FFFAFAFA'), findsNWidgets(2));
      expect(find.text('#FFFFFFFF'), findsNWidgets(8));
      expect(find.text('#1F000000'), findsNWidgets(2));
      expect(find.text('#0A000000'), findsOneWidget);
      expect(find.text('#66BCBCBC'), findsOneWidget);
      expect(find.text('#66C8C8C8'), findsOneWidget);
      expect(find.text('#61000000'), findsOneWidget);
      expect(find.text('#FFE0E0E0'), findsOneWidget);
      expect(find.text('#FF64B5F6'), findsOneWidget);
      expect(find.text('#FF4285F4'), findsOneWidget);
      expect(find.text('#FF90CAF9'), findsNWidgets(3));
      expect(find.text('#99000000'), findsOneWidget);
      expect(find.text('#FFFF5252'), findsNWidgets(2));
      expect(find.text('#FF1E88E5'), findsOneWidget);
      expect(find.text('#FF000000'), findsOneWidget);
    });
  });
}
