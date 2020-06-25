import 'package:flutter_test/flutter_test.dart';
import 'package:weight_tracker/main.app.framy.dart';
import 'package:weight_tracker/models/user.dart';

import 'test_utils.dart';

void main() {
  group('PresetsDropdownTest', () {
    FramyDependencyModel getUserModel([User defaultValue]) {
      return FramyDependencyModel<User>('user', 'User', defaultValue, [
        FramyDependencyModel<String>('firstName', 'String', null, []),
        FramyDependencyModel<String>('lastName', 'String', null, []),
        FramyDependencyModel<int>('age', 'int', null, []),
        FramyDependencyModel<List<String>>('emails', 'List<String>', null, []),
      ]);
    }

    testWidgets('should build', (tester) async {
      await tester.pumpWidget(TestMaterialAppWithScaffold(FramyPresetDropdown(
        dependency: getUserModel(),
        presets: {},
      )));
      expect(find.byType(FramyPresetDropdown), findsOneWidget);
    });

    testWidgets('should display Null when dependency.value is null',
        (tester) async {
      await tester.pumpWidget(TestMaterialAppWithScaffold(FramyPresetDropdown(
        dependency: getUserModel(),
        presets: {},
      )));
      expect(find.text('Null').hitTestable(), findsOneWidget);
      expect(find.text('Custom').hitTestable(), findsNothing);
    });

    testWidgets('should display Custom when dependency.value is not null',
        (tester) async {
      await tester.pumpWidget(TestMaterialAppWithScaffold(FramyPresetDropdown(
        dependency: getUserModel(User('', '', 1)),
        presets: {},
      )));
      expect(find.text('Null').hitTestable(), findsNothing);
      expect(find.text('Custom').hitTestable(), findsOneWidget);
    });

    testWidgets('should emit null on Null select from dropdown',
        (tester) async {
      //given
      final initialValue = User(null, null, null);
      dynamic emittedValue = User(null, null, 1);
      await tester.pumpWidget(TestMaterialAppWithScaffold(FramyPresetDropdown(
        dependency: getUserModel(initialValue),
        presets: {},
        onChanged: (newValue) => emittedValue = newValue,
      )));
      //when
      await tester.tap(find.text('Custom'));
      await tester.pump();
      await tester.tap(find.text('Null').last);
      //then
      expect(emittedValue, isNull);
    });

    testWidgets('should emit non-null on Custom select from dropdown',
        (tester) async {
      //given
      dynamic emittedValue;
      await tester.pumpWidget(TestMaterialAppWithScaffold(FramyPresetDropdown(
        dependency: getUserModel(),
        presets: {},
        onChanged: (newValue) => emittedValue = newValue,
      )));
      //when
      await tester.tap(find.text('Null'));
      await tester.pump();
      await tester.tap(find.text('Custom').last);
      //then
      expect(emittedValue, isNotNull);
    });
  });
}
