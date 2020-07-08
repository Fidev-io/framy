import 'package:counter_app/main.app.framy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppBar', () {
    testWidgets('should build', (tester) async {
      await tester.pumpWidget(_TestAppBar());
      expect(find.byKey(Key('FramyAppBar')), findsOneWidget);
    });

    testWidgets('should have title', (tester) async {
      await tester.pumpWidget(_TestAppBar());
      expect(find.text('Framy App'), findsOneWidget);
    });

    testWidgets('should have drawer button when Scaffold has drawer',
        (tester) async {
      await tester.pumpWidget(_TestAppBar(drawer: Container()));
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    testWidgets('should have Settings button',
        (tester) async {
      await tester.pumpWidget(_TestAppBar(drawer: Container()));
      expect(find.byKey(ValueKey('FramyAppBarSettingsButton')), findsOneWidget);
    });
  });
}

class _TestAppBar extends StatelessWidget {
  final Widget drawer;

  const _TestAppBar({Key key, this.drawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FramyAppSettingsState(
      wrapWithScaffold: true,
      wrapWithSafeArea: false,
      wrapWithCenter: false,
      child: MaterialApp(
        home: Scaffold(
          appBar: FramyAppBar(),
          drawer: drawer,
        ),
      ),
    );
  }
}
