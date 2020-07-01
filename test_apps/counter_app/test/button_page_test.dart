import 'package:counter_app/main.app.framy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_utils.dart';

void main() {
  group('FramyButtonPage', () {
    testWidgets('should build', (tester) async {
      await tester.pumpWidget(TestMaterialAppWithScaffold(FramyButtonPage()));
      expect(find.byKey(Key('FramyButtonPage')), findsOneWidget);
    });

    testWidgets('should have Raised button text', (tester) async {
      await tester.pumpWidget(TestMaterialAppWithScaffold(FramyButtonPage()));
      expect(find.text('Raised button'), findsOneWidget);
    });

    testWidgets('should have 4 RaisedButtons', (tester) async {
      await tester.pumpWidget(TestMaterialAppWithScaffold(FramyButtonPage()));
      //Outline buttons are Raised buttons as well so we need to count them too.
      expect(find.byType(RaisedButton), findsNWidgets(4));
    });

    testWidgets('should have Flat button text', (tester) async {
      await tester.pumpWidget(TestMaterialAppWithScaffold(FramyButtonPage()));
      expect(find.text('Flat button'), findsOneWidget);
    });

    testWidgets('should have two FlatButtons', (tester) async {
      await tester.pumpWidget(TestMaterialAppWithScaffold(FramyButtonPage()));
      expect(find.byType(FlatButton), findsNWidgets(2));
    });

    testWidgets('should have Outline button text', (tester) async {
      await tester.pumpWidget(TestMaterialAppWithScaffold(FramyButtonPage()));
      expect(find.text('Outline button'), findsOneWidget);
    });

    testWidgets('should have two OutlineButtons', (tester) async {
      await tester.pumpWidget(TestMaterialAppWithScaffold(FramyButtonPage()));
      expect(find.byType(OutlineButton), findsNWidgets(2));
    });

    testWidgets('should have Floating Action Button text', (tester) async {
      await tester.pumpWidget(TestMaterialAppWithScaffold(FramyButtonPage()));
      expect(find.text('Floating Action Button'), findsOneWidget);
    });

    testWidgets('should have three FloatingActionButtons', (tester) async {
      await tester.pumpWidget(TestMaterialAppWithScaffold(FramyButtonPage()));
      expect(find.byType(FloatingActionButton), findsNWidgets(3));
    });

    testWidgets('should have Icon button text', (tester) async {
      await tester.pumpWidget(TestMaterialAppWithScaffold(FramyButtonPage()));
      expect(find.text('Icon button'), findsOneWidget);
    });

    testWidgets('should have two IconButtons', (tester) async {
      await tester.pumpWidget(TestMaterialAppWithScaffold(FramyButtonPage()));
      expect(find.byType(IconButton), findsNWidgets(2));
    });

    testWidgets('should have Dropdown button', (tester) async {
      await tester.pumpWidget(TestMaterialAppWithScaffold(FramyButtonPage()));
      expect(find.byType(DropdownButton<String>().runtimeType), findsOneWidget);
    });
  });
}
