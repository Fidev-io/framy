// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// FramyTestGenerator
// **************************************************************************

// ignore_for_file: unused_import
// ignore_for_file: directives_ordering
// ignore_for_file: type_annotate_public_apis
// ignore_for_file: prefer_const_constructors
// ignore_for_file: invalid_assignment
// ignore_for_file: argument_type_not_assignable
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: avoid_return_types_on_setters
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: sort_child_properties_last
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_generic_function_type_aliases
// ignore_for_file: prefer_conditional_assignment
// ignore_for_file: avoid_unused_constructor_parameters
// ignore_for_file: prefer_typing_uninitialized_variables
// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:provider/provider.dart' as provider;
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:ui';
import 'package:weight_tracker/main.app.framy.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weight_tracker/app_theme.dart';
import 'package:framy_annotation/framy_annotation.dart';
import 'dart:core';
import 'package:weight_tracker/pages/history_page.dart';
import 'package:weight_tracker/widgets/weight_entry_list_item.dart';
import 'package:weight_tracker/models/weight_entry.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weight_tracker/pages/statistics_page.dart';
import 'package:weight_tracker/models/statistics_page_state.dart';
import 'package:weight_tracker/pages/profile_page.dart';
import 'package:weight_tracker/widgets/user_emails_view.dart';
import 'package:weight_tracker/widgets/user_data_card.dart';
import 'package:weight_tracker/models/user.dart';
import 'package:weight_tracker/widgets/weight_unit_display.dart';
import 'package:weight_tracker/widgets/built_value_example_widget.dart';
import 'package:weight_tracker/models/built_value_user.dart';
import 'package:weight_tracker/widgets/progress_chart.dart';
import 'package:weight_tracker/models/weight_unit.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'package:weight_tracker/models/utils.dart';
import 'package:weight_tracker/widgets/progress_chart_utils.dart';
import 'package:weight_tracker/widgets/dummy_test_widget.dart';
import 'package:weight_tracker/models/dummy_test_widget_model.dart';
import 'package:built_value/built_value.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weight_tracker/models/weight_entry.framy.dart';
import 'package:weight_tracker/models/user.framy.dart';

void main() async {
  final binding = TestWidgetsFlutterBinding.ensureInitialized();
  var fontLoader = FontLoader('Roboto');
  fontLoader.addFont(loadRobotoFont());
  await fontLoader.load();
  (binding.window as TestWindow)
    ..physicalSizeTestValue = Size(414, 896)
    ..devicePixelRatioTestValue = 1.0;
  group('HistoryPage', () {
    testWidgets('default', (tester) async {
      final dependencies = [
        FramyDependencyModel<List<WeightEntry>>(
            'weightEntries', 'List<WeightEntry>', null),
      ];
      final valueGetter = (String name) =>
          dependencies.singleWhere((d) => d.name == name).value;
      final widget = ProviderScope(
        overrides: [
          weightEntries
              .overrideAs(Provider((_) => valueGetter('weightEntries'))),
        ],
        child: HistoryPage(),
      );
      await tester.pumpWrappedWidget(widget);
      await expectLater(
        find.byType(HistoryPage),
        matchesGoldenFile('goldens/HistoryPage_default.png'),
      );
    });

    createFramyPresets()['List<WeightEntry>']
        ?.forEach((presetName, presetValue) {
      testWidgets(presetName, (tester) async {
        final dependencies = [
          FramyDependencyModel<List<WeightEntry>>(
              'weightEntries', 'List<WeightEntry>', null),
        ];
        dependencies
            .where((dep) => dep.type == 'List<WeightEntry>')
            .forEach((dep) => dep.value = presetValue);
        final valueGetter = (String name) =>
            dependencies.singleWhere((d) => d.name == name).value;
        final widget = ProviderScope(
          overrides: [
            weightEntries
                .overrideAs(Provider((_) => valueGetter('weightEntries'))),
          ],
          child: HistoryPage(),
        );
        await tester.pumpWrappedWidget(widget);
        await expectLater(
          find.byType(HistoryPage),
          matchesGoldenFile('goldens/HistoryPage_$presetName.png'),
        );
      });
    });
  });

  group('StatisticsPage', () {
    testWidgets('default', (tester) async {
      final dependencies = [
        FramyDependencyModel<StatisticsPageState>(
            'state', 'StatisticsPageState', null),
      ];
      final valueGetter = (String name) =>
          dependencies.singleWhere((d) => d.name == name).value;
      final widget = StatisticsPage(
        state: valueGetter('state'),
      );
      await tester.pumpWrappedWidget(widget);
      await expectLater(
        find.byType(StatisticsPage),
        matchesGoldenFile('goldens/StatisticsPage_default.png'),
      );
    });
  });

  group('ProfilePage', () {
    testWidgets('default', (tester) async {
      final dependencies = [
        FramyDependencyModel<User>('User', 'User', null),
      ];
      final valueGetter = (String name) =>
          dependencies.singleWhere((d) => d.name == name).value;
      final widget = provider.MultiProvider(
        providers: [
          provider.Provider<User>.value(value: valueGetter('User')),
        ],
        child: ProfilePage(),
      );
      await tester.pumpWrappedWidget(widget);
      await expectLater(
        find.byType(ProfilePage),
        matchesGoldenFile('goldens/ProfilePage_default.png'),
      );
    });

    createFramyPresets()['User']?.forEach((presetName, presetValue) {
      testWidgets(presetName, (tester) async {
        final dependencies = [
          FramyDependencyModel<User>('User', 'User', null),
        ];
        dependencies
            .where((dep) => dep.type == 'User')
            .forEach((dep) => dep.value = presetValue);
        final valueGetter = (String name) =>
            dependencies.singleWhere((d) => d.name == name).value;
        final widget = provider.MultiProvider(
          providers: [
            provider.Provider<User>.value(value: valueGetter('User')),
          ],
          child: ProfilePage(),
        );
        await tester.pumpWrappedWidget(widget);
        await expectLater(
          find.byType(ProfilePage),
          matchesGoldenFile('goldens/ProfilePage_$presetName.png'),
        );
      });
    });
  });

  group('BuiltValueExampleWidget', () {
    testWidgets('default', (tester) async {
      final dependencies = [
        FramyDependencyModel<BuiltUser>('user', 'BuiltUser', null),
      ];
      final valueGetter = (String name) =>
          dependencies.singleWhere((d) => d.name == name).value;
      final widget = BuiltValueExampleWidget(
        user: valueGetter('user'),
      );
      await tester.pumpWrappedWidget(widget);
      await expectLater(
        find.byType(BuiltValueExampleWidget),
        matchesGoldenFile('goldens/BuiltValueExampleWidget_default.png'),
      );
    });
  });

  group('ProgressChart', () {
    testWidgets('default', (tester) async {
      final dependencies = [
        FramyDependencyModel<List<WeightEntry>>(
            'weightEntries', 'List<WeightEntry>', null),
      ];
      final valueGetter = (String name) =>
          dependencies.singleWhere((d) => d.name == name).value;
      final widget = ProgressChart(
        weightEntries: valueGetter('weightEntries'),
      );
      await tester.pumpWrappedWidget(widget);
      await expectLater(
        find.byType(ProgressChart),
        matchesGoldenFile('goldens/ProgressChart_default.png'),
      );
    });

    createFramyPresets()['List<WeightEntry>']
        ?.forEach((presetName, presetValue) {
      testWidgets(presetName, (tester) async {
        final dependencies = [
          FramyDependencyModel<List<WeightEntry>>(
              'weightEntries', 'List<WeightEntry>', null),
        ];
        dependencies
            .where((dep) => dep.type == 'List<WeightEntry>')
            .forEach((dep) => dep.value = presetValue);
        final valueGetter = (String name) =>
            dependencies.singleWhere((d) => d.name == name).value;
        final widget = ProgressChart(
          weightEntries: valueGetter('weightEntries'),
        );
        await tester.pumpWrappedWidget(widget);
        await expectLater(
          find.byType(ProgressChart),
          matchesGoldenFile('goldens/ProgressChart_$presetName.png'),
        );
      });
    });
  });

  group('DummyTestWidget', () {
    testWidgets('default', (tester) async {
      final dependencies = [
        FramyDependencyModel<DummyTestWidgetModel>(
            'model', 'DummyTestWidgetModel', null),
      ];
      final valueGetter = (String name) =>
          dependencies.singleWhere((d) => d.name == name).value;
      final widget = DummyTestWidget(
        model: valueGetter('model'),
      );
      await tester.pumpWrappedWidget(widget);
      await expectLater(
        find.byType(DummyTestWidget),
        matchesGoldenFile('goldens/DummyTestWidget_default.png'),
      );
    });
  });

  group('UserDataCard', () {
    testWidgets('default', (tester) async {
      final dependencies = [
        FramyDependencyModel<User>('user', 'User', null),
      ];
      final valueGetter = (String name) =>
          dependencies.singleWhere((d) => d.name == name).value;
      final widget = UserDataCard(
        user: valueGetter('user'),
      );
      await tester.pumpWrappedWidget(widget);
      await expectLater(
        find.byType(UserDataCard),
        matchesGoldenFile('goldens/UserDataCard_default.png'),
      );
    });

    createFramyPresets()['User']?.forEach((presetName, presetValue) {
      testWidgets(presetName, (tester) async {
        final dependencies = [
          FramyDependencyModel<User>('user', 'User', null),
        ];
        dependencies
            .where((dep) => dep.type == 'User')
            .forEach((dep) => dep.value = presetValue);
        final valueGetter = (String name) =>
            dependencies.singleWhere((d) => d.name == name).value;
        final widget = UserDataCard(
          user: valueGetter('user'),
        );
        await tester.pumpWrappedWidget(widget);
        await expectLater(
          find.byType(UserDataCard),
          matchesGoldenFile('goldens/UserDataCard_$presetName.png'),
        );
      });
    });
  });

  group('UserEmailsView', () {
    testWidgets('default', (tester) async {
      final dependencies = [
        FramyDependencyModel<User>('user', 'User', null),
      ];
      final valueGetter = (String name) =>
          dependencies.singleWhere((d) => d.name == name).value;
      final widget = UserEmailsView(
        user: valueGetter('user'),
      );
      await tester.pumpWrappedWidget(widget);
      await expectLater(
        find.byType(UserEmailsView),
        matchesGoldenFile('goldens/UserEmailsView_default.png'),
      );
    });

    createFramyPresets()['User']?.forEach((presetName, presetValue) {
      testWidgets(presetName, (tester) async {
        final dependencies = [
          FramyDependencyModel<User>('user', 'User', null),
        ];
        dependencies
            .where((dep) => dep.type == 'User')
            .forEach((dep) => dep.value = presetValue);
        final valueGetter = (String name) =>
            dependencies.singleWhere((d) => d.name == name).value;
        final widget = UserEmailsView(
          user: valueGetter('user'),
        );
        await tester.pumpWrappedWidget(widget);
        await expectLater(
          find.byType(UserEmailsView),
          matchesGoldenFile('goldens/UserEmailsView_$presetName.png'),
        );
      });
    });
  });

  group('WeightUnitDisplay', () {
    testWidgets('default', (tester) async {
      final dependencies = [
        FramyDependencyModel<WeightUnit>(
            'weightUnit', 'WeightUnit', WeightUnit.kg),
      ];
      final valueGetter = (String name) =>
          dependencies.singleWhere((d) => d.name == name).value;
      final widget = WeightUnitDisplay(
        weightUnit: valueGetter('weightUnit'),
      );
      await tester.pumpWrappedWidget(widget);
      await expectLater(
        find.byType(WeightUnitDisplay),
        matchesGoldenFile('goldens/WeightUnitDisplay_default.png'),
      );
    });
  });

  group('WeightEntryListItem', () {
    testWidgets('default', (tester) async {
      final dependencies = [
        FramyDependencyModel<WeightEntry>('weightEntry', 'WeightEntry', null),
        FramyDependencyModel<double>('weightDifference', 'double', 0),
        FramyDependencyModel<void Function(WeightEntry)>(
            'onTap', 'void Function(WeightEntry)', null),
      ];
      final valueGetter = (String name) =>
          dependencies.singleWhere((d) => d.name == name).value;
      final widget = WeightEntryListItem(
        weightEntry: valueGetter('weightEntry'),
        weightDifference: valueGetter('weightDifference'),
        onTap: valueGetter('onTap'),
      );
      await tester.pumpWrappedWidget(widget);
      await expectLater(
        find.byType(WeightEntryListItem),
        matchesGoldenFile('goldens/WeightEntryListItem_default.png'),
      );
    });

    createFramyPresets()['WeightEntry']?.forEach((presetName, presetValue) {
      testWidgets(presetName, (tester) async {
        final dependencies = [
          FramyDependencyModel<WeightEntry>('weightEntry', 'WeightEntry', null),
          FramyDependencyModel<double>('weightDifference', 'double', 0),
          FramyDependencyModel<void Function(WeightEntry)>(
              'onTap', 'void Function(WeightEntry)', null),
        ];
        dependencies
            .where((dep) => dep.type == 'WeightEntry')
            .forEach((dep) => dep.value = presetValue);
        final valueGetter = (String name) =>
            dependencies.singleWhere((d) => d.name == name).value;
        final widget = WeightEntryListItem(
          weightEntry: valueGetter('weightEntry'),
          weightDifference: valueGetter('weightDifference'),
          onTap: valueGetter('onTap'),
        );
        await tester.pumpWrappedWidget(widget);
        await expectLater(
          find.byType(WeightEntryListItem),
          matchesGoldenFile('goldens/WeightEntryListItem_$presetName.png'),
        );
      });
    });
  });
}

extension on WidgetTester {
  Future<void> pumpWrappedWidget(Widget child) => pumpWidget(
        MaterialApp(
          theme: AppTheme.themeData,
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: child,
          ),
        ),
      );
}

/// This is hacky as hell, but it seems to work :)
/// It gets the Roboto font from package directory.
/// If it causes problem for you, please let us know at https://github.com/fidev-io/framy/issues
Future<ByteData> loadRobotoFont() async {
  final isInTestDir = Directory.current.absolute.path.endsWith('/test');
  var packagesInfoPath = '.packages';
  if (isInTestDir) {
    packagesInfoPath = '../$packagesInfoPath';
  }
  final packagesInfo = File(packagesInfoPath).readAsLinesSync();
  var generatorUri = packagesInfo
      .singleWhere((element) => element.startsWith('framy_generator'))
      .substring(16);
  if (generatorUri.startsWith('file://')) {
    generatorUri = generatorUri.substring(7);
  }
  if (isInTestDir && generatorUri.contains('..')) {
    generatorUri = generatorUri.replaceFirst('..', '../..');
  }
  final robotoFont = File('${generatorUri}fonts/Roboto.ttf');
  final bytes = await robotoFont.readAsBytes();
  return ByteData.view(bytes.buffer);
}
