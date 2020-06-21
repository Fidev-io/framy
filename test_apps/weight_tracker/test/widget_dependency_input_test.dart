import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weight_tracker/main.app.framy.dart';
import 'package:weight_tracker/models/user.dart';

import 'test_utils.dart';

void main() {
  FramyDependencyModel _getStringModel([String defaultValue]) =>
      FramyDependencyModel<String>('name', 'String', defaultValue, []);

  FramyDependencyModel _getUserModel([User defaultValue]) =>
      FramyDependencyModel<User>('user', 'User', defaultValue, [
        FramyDependencyModel<String>('firstName', 'String', null, []),
        FramyDependencyModel<String>('lastName', 'String', null, []),
        FramyDependencyModel<int>('age', 'int', null, []),
      ]);

  Future<void> _buildDependencyInput(
    WidgetTester tester,
    FramyDependencyModel dependency, {
    Function(String, dynamic) onChanged,
    Map<String, Map<String, dynamic>> presets = const {},
  }) async {
    await tester.pumpWidget(
      TestMaterialAppWithScaffold(
        FramyWidgetDependencyInput(
          dependency: dependency,
          onChanged: onChanged ?? (_, __) {},
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
      expect(find.byType(FramyWidgetDependencyInput), findsNWidgets(4));
    });

    testWidgets(
        'should not show presets dropdown for User when no presets for User',
        (WidgetTester tester) async {
      await _buildDependencyInput(tester, _getUserModel());
      expect(find.byKey(Key('framy_user_preset_dropdown')), findsNothing);
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
          onChanged: (name, value) => emitted = value,
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
        customModel.subDependencies[0].value = 'Adam';
        customModel.subDependencies[1].value = 'Smith';
        customModel.subDependencies[2].value = 25;
        await _buildDependencyInput(
          tester,
          customModel,
          presets: {
            'User': {'user1': presetUser}
          },
          onChanged: (name, value) => emitted = value,
        );
        //when
        await choosePreset(tester, 'Custom');
        //then
        expect(emitted.firstName, 'Adam');
        expect(emitted.lastName, 'Smith');
        expect(emitted.age, 25);
      });
    });
  });
}
