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

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:ui';
import 'package:counter_app/main.app.framy.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:counter_app/main.dart';
import 'package:framy_annotation/framy_annotation.dart';
import 'dart:core';

void main() async {
  final binding = TestWidgetsFlutterBinding.ensureInitialized();
  var fontLoader = FontLoader('Roboto');
  fontLoader.addFont(loadRobotoFont());
  await fontLoader.load();
  (binding.window as TestWindow)
    ..physicalSizeTestValue = Size(414, 896)
    ..devicePixelRatioTestValue = 1.0;
  group('CounterFAB', () {
    testWidgets('default', (tester) async {
      final dependencies = [
        FramyDependencyModel<void Function()>(
            'onPressed', 'void Function()', null),
      ];
      final valueGetter = (String name) =>
          dependencies.singleWhere((d) => d.name == name).value;
      final widget = CounterFAB(
        onPressed: valueGetter('onPressed'),
      );
      await tester.pumpWrappedWidget(widget);
      await expectLater(
        find.byType(CounterFAB),
        matchesGoldenFile('goldens/CounterFAB_default.png'),
      );
    });
  });

  group('CounterTitle', () {
    testWidgets('default', (tester) async {
      final dependencies = [
        FramyDependencyModel<String>('verb', 'String', 'pushed'),
        FramyDependencyModel<int>('counter', 'int', 0),
      ];
      final valueGetter = (String name) =>
          dependencies.singleWhere((d) => d.name == name).value;
      final widget = CounterTitle(
        verb: valueGetter('verb'),
        counter: valueGetter('counter'),
      );
      await tester.pumpWrappedWidget(widget);
      await expectLater(
        find.byType(CounterTitle),
        matchesGoldenFile('goldens/CounterTitle_default.png'),
      );
    });
  });
}

extension on WidgetTester {
  Future<void> pumpWrappedWidget(Widget child) => pumpWidget(
        MaterialApp(
          theme: getThemeData(),
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
