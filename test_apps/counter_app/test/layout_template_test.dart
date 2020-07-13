import 'package:counter_app/main.app.framy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_utils.dart';

void main() {
  group('FramyLayoutTemplate', () {
    testWidgets('should build', (tester) async {
      await tester.pumpWidget(_TestLayoutTemplate());
      expect(find.byType(FramyLayoutTemplate), findsOneWidget);
    });

    testWidgets('should display child', (tester) async {
      await tester.pumpWidget(_TestLayoutTemplate());
      expect(find.text('foo'), findsOneWidget);
    });

    testWidgets('should have an app bar', (tester) async {
      await tester.pumpWidget(_TestLayoutTemplate());
      expect(find.byKey(Key('FramyAppBar')), findsOneWidget);
    });

    testWidgets('should have an openable drawer', (tester) async {
      //given
      await tester.pumpWidget(_TestLayoutTemplate());
      expect(find.byKey(Key('FramyDrawer')), findsNothing);
      //when
      await tester.tap(find.byTooltip('Open navigation menu'));
      await tester.pump();
      //then
      expect(find.byKey(Key('FramyDrawer')), findsOneWidget);
    });

    testWidgets('should have an opened drawer on big devices', (tester) async {
      //given
      tester.binding.window.physicalSizeTestValue = Size(1000, 800);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      //when
      await tester.pumpWidget(_TestLayoutTemplate());
      //then
      expect(find.byTooltip('Open navigation menu'), findsNothing);
      expect(find.byKey(Key('FramyDrawer')), findsOneWidget);
    });

    testWidgets('should have a close/open drawer button on big devices',
        (tester) async {
      //given
      tester.binding.window.physicalSizeTestValue = Size(1000, 800);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      await tester.pumpWidget(FramyApp());
      //when close
      await tester.tap(find.byTooltip('Close navigation menu'));
      await tester.pump();
      //then
      expect(find.byKey(Key('FramyDrawer')), findsNothing);
      //when open
      await tester.tap(find.byTooltip('Open navigation menu'));
      await tester.pump();
      //then
      expect(find.byKey(Key('FramyDrawer')), findsOneWidget);
    });
  });
}

class _TestLayoutTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FramyAppWrapper(
      FramyLayoutTemplate(
        child: Text('foo'),
      ),
    );
  }
}
