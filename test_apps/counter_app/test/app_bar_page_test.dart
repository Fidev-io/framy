import 'package:counter_app/main.app.framy.dart';
import 'package:counter_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FramyAppBarPage', () {
    testWidgets('should build', (tester) async {
      await tester.pumpWidget(_TestAppBarPage());
      expect(find.byKey(Key('FramyAppBarPage')), findsOneWidget);
    });

    testWidgets('should have 4 AppBars', (tester) async {
      await tester.pumpWidget(_TestAppBarPage());
      expect(find.byType(AppBar), findsNWidgets(4));
    });
  });
}

class _TestAppBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getThemeData(),
      home: FramyAppBarPage(),
    );
  }
}