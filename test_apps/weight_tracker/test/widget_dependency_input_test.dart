import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weight_tracker/main.app.framy.dart';
import 'package:weight_tracker/models/user.dart';
import 'package:weight_tracker/models/weight_entry.dart';
import 'package:weight_tracker/models/weight_entry.framy.dart';
import 'package:weight_tracker/models/weight_unit.dart';

import 'test_utils.dart';

void main() {
  FramyDependencyModel _getStringModel([String defaultValue]) =>
      FramyDependencyModel<String>('name', 'String', defaultValue);

  FramyDependencyModel _getUserModel([User defaultValue]) =>
      FramyDependencyModel<User>('user', 'User', defaultValue);

  FramyDependencyModel _getWeightEntryModel([WeightEntry defaultValue]) =>
      FramyDependencyModel<WeightEntry>(
          'weightEntry', 'WeightEntry', defaultValue);

  FramyDependencyModel _getStringListModel([List<String> defaultValue]) =>
      FramyDependencyModel<List<String>>(
          'strings', 'List<String>', defaultValue);

  FramyDependencyModel _getEnumModel([WeightUnit defaultValue]) =>
      FramyDependencyModel<WeightUnit>(
          'weightUnit', 'WeightUnit', defaultValue);

  FramyDependencyModel _getDateTimeModel([DateTime defaultValue]) =>
      FramyDependencyModel<DateTime>('dateTime', 'DateTime', defaultValue);

  Future<void> _buildDependencyInput(
    WidgetTester tester,
    FramyDependencyModel dependency, {
    ValueChanged<FramyDependencyModel> onChanged,
    Map<String, Map<String, dynamic>> presets = const {},
  }) async {
    await tester.pumpWidget(
      TestMaterialAppWithScaffold(
        FramyWidgetDependencyInput(
          dependency: dependency,
          onChanged: onChanged ?? (_) {},
          presets: presets,
        ),
      ),
    );
  }

  group('FramyWidgetDependencyInput', () {
    testWidgets('should build for String model', (WidgetTester tester) async {
      await _buildDependencyInput(tester, _getStringModel());
      expect(find.byType(FramyWidgetDependencyInput), findsOneWidget);
    });

    testWidgets('should build recursively for User model',
        (WidgetTester tester) async {
      await _buildDependencyInput(tester, _getUserModel());
      expect(find.byType(FramyWidgetDependencyInput), findsNWidgets(5));
    });

    testWidgets(
        'should show presets dropdown for User when no presets for User',
        (WidgetTester tester) async {
      await _buildDependencyInput(tester, _getUserModel());
      expect(find.byKey(Key('framy_user_preset_dropdown')), findsOneWidget);
    });

    group('when User has presets', () {
      testWidgets('should show presets dropdown', (WidgetTester tester) async {
        await _buildDependencyInput(tester, _getUserModel(), presets: {
          'User': {'user1': User('John', 'Doe', 11)}
        });
        expect(find.byKey(Key('framy_user_preset_dropdown')), findsOneWidget);
      });

      Future<void> choosePreset(WidgetTester tester, String text) async {
        await tester.tap(find.byKey(Key('framy_user_preset_dropdown')));
        await tester.pump();
        await tester.tap(find.text(text).last);
      }

      testWidgets('should emit new value when preset is pressed in dropdown',
          (WidgetTester tester) async {
        //given
        User emitted;
        final presetUser = User('John', 'Doe', 11);
        await _buildDependencyInput(
          tester,
          _getUserModel(),
          presets: {
            'User': {'user1': presetUser}
          },
          onChanged: (dep) => emitted = dep.value,
        );
        //when
        await choosePreset(tester, 'user1');
        //then
        expect(emitted, presetUser);
      });

      testWidgets('should not show field inputs when preset is chosen',
          (WidgetTester tester) async {
        //given
        final presetUser = User('John', 'Doe', 11);
        await _buildDependencyInput(
          tester,
          _getUserModel(presetUser),
          presets: {
            'User': {'user1': presetUser}
          },
        );
        //then
        expect(
            find.byKey(Key('framy_dependency_firstName_input')), findsNothing);
      });

      testWidgets('should emit last custom value when its set back to custom',
          (WidgetTester tester) async {
        //given
        User emitted;
        final presetUser = User('John', 'Doe', 11);
        final customModel = _getUserModel(presetUser);
        customModel.lastCustomValue = User('Adam', 'Smith', 25);
        await _buildDependencyInput(
          tester,
          customModel,
          presets: {
            'User': {'user1': presetUser}
          },
          onChanged: (dep) => emitted = dep.value,
        );
        //when
        await choosePreset(tester, 'Custom');
        //then
        expect(emitted.firstName, 'Adam');
        expect(emitted.lastName, 'Smith');
        expect(emitted.age, 25);
      });
    });

    group('when the type is a list', () {
      testWidgets('it should build', (WidgetTester tester) async {
        await _buildDependencyInput(tester, _getStringListModel());
        expect(find.byType(FramyWidgetDependencyInput), findsOneWidget);
      });

      testWidgets('it should display widgetListDependencyInput',
          (WidgetTester tester) async {
        await _buildDependencyInput(tester, _getStringListModel());
        expect(find.byType(FramyWidgetListDependencyInput), findsOneWidget);
      });
    });

    group('when the type is an enum', () {
      testWidgets('it should build', (WidgetTester tester) async {
        await _buildDependencyInput(tester, _getEnumModel());
        expect(find.byType(FramyWidgetDependencyInput), findsOneWidget);
      });

      testWidgets('it should have extra dropdown', (WidgetTester tester) async {
        await _buildDependencyInput(tester, _getEnumModel());
        //one for presets, second for enum values
        expect(find.byType(DropdownButton), findsNWidgets(2));
      });

      testWidgets('it should show default enum name',
          (WidgetTester tester) async {
        await _buildDependencyInput(
          tester,
          _getEnumModel(WeightUnit.lbs),
        );
        expect(find.text('lbs'), findsOneWidget);
      });

      testWidgets('it should emit new value on dropdown change',
          (WidgetTester tester) async {
        //given
        WeightUnit emittedValue;
        await _buildDependencyInput(
          tester,
          _getEnumModel(),
          onChanged: (dep) => emittedValue = dep.value,
        );
        //when
        await tester.tap(find.byKey(Key('framy_dependency_weightUnit_input')));
        await tester.pump();
        await tester.tap(find.text('lbs').last);
        //then
        expect(emittedValue, WeightUnit.lbs);
      });
    });

    group('when the type is an DateTime', () {
      testWidgets('it should build', (WidgetTester tester) async {
        await _buildDependencyInput(tester, _getDateTimeModel());
        expect(find.byType(FramyWidgetDependencyInput), findsOneWidget);
      });

      testWidgets('it should show "-" when value is null',
          (WidgetTester tester) async {
        await _buildDependencyInput(tester, _getDateTimeModel());
        expect(find.text('-'), findsOneWidget);
      });

      testWidgets('it should show default DateTime',
          (WidgetTester tester) async {
        await _buildDependencyInput(tester, _getDateTimeModel(DateTime(2020)));
        expect(find.text('2020-01-01 00:00:00'), findsOneWidget);
      });

      testWidgets('it should show a dialog on tap',
          (WidgetTester tester) async {
        //given
        await _buildDependencyInput(tester, _getDateTimeModel(DateTime(2020)));
        //when
        await tester.tap(find.byKey(Key('framy_dependency_dateTime_input')));
        await tester.pump();
        //then
        expect(find.byType(Dialog), findsOneWidget);
      });

      testWidgets('it should emit new value on date selection',
          (WidgetTester tester) async {
        //given
        DateTime emitted;
        await _buildDependencyInput(
          tester,
          _getDateTimeModel(DateTime(2020)),
          onChanged: (dep) => emitted = dep.value,
        );
        await tester.tap(find.byKey(Key('framy_dependency_dateTime_input')));
        await tester.pump();
        //when
        await tester.tap(find.text('31'));
        await tester.tap(find.text('OK'));
        await tester.pump();
        //then
        expect(emitted.day, 31);
      });

      testWidgets('it should not emit any value when ',
          (WidgetTester tester) async {
        //given
        bool didEmit = false;
        await _buildDependencyInput(
          tester,
          _getDateTimeModel(DateTime(2020)),
          onChanged: (dep) => didEmit = true,
        );
        await tester.tap(find.byKey(Key('framy_dependency_dateTime_input')));
        await tester.pump();
        //when
        await tester.tap(find.text('CANCEL'));
        await tester.pump();
        //then
        expect(didEmit, isFalse);
      });
    });

    group('ConstructorDropdown usage', () {
      testWidgets(
          'should not show constructor dropdown when class has only one constructor',
          (WidgetTester tester) async {
        await _buildDependencyInput(tester, _getUserModel());
        expect(find.byType(FramyConstructorDropdown), findsNothing);
      });

      testWidgets(
          'should show constructor dropdown when class has more than one constructor',
          (WidgetTester tester) async {
        //given
        expect(framyAvailableConstructorNames['WeightEntry'], hasLength(2));
        final model = _getWeightEntryModel();
        //when
        await _buildDependencyInput(tester, model);
        //then
        expect(find.byType(FramyConstructorDropdown), findsOneWidget);
      });

      testWidgets(
          'should not show constructor dropdown when chosen value is a preset',
          (WidgetTester tester) async {
        //given
        expect(framyAvailableConstructorNames['WeightEntry'], hasLength(2));
        final model = _getWeightEntryModel(presetEntry());
        //when
        await _buildDependencyInput(tester, model);
        //then
        expect(find.byType(FramyConstructorDropdown), findsOneWidget);
      });
    });
  });
}
