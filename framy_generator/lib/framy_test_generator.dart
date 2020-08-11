import 'dart:async';

import 'package:build/build.dart';
import 'package:framy_annotation/framy_annotation.dart';
import 'package:framy_generator/builder.dart';
import 'package:framy_generator/framy_generator.dart';
import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/imports_generator.dart';
import 'package:framy_generator/generator/lint_ignores_generator.dart';
import 'package:framy_generator/test_generator/generate_test_utils.dart';
import 'package:framy_generator/test_generator/generate_tests.dart';
import 'package:source_gen/source_gen.dart';

class FramyTestGenerator extends GeneratorForAnnotation<FramyGoldenTests> {
  @override
  Future<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    final themeFramyObjects =
        await loadFramyObjects(buildStep, '**.theme.framy.json');
    final widgetFramyObjects =
        await loadFramyObjects(buildStep, '**.widget.framy.json');
    //it contains both data classes and enums
    final modelFramyObjects =
        await loadFramyObjects(buildStep, '**.model.framy.json');
    final presetFramyObjects =
        await loadFramyObjects(buildStep, '**.preset.framy.json');
    final riverpodFramyObjects =
        await loadFramyObjects(buildStep, '**.riverpod.framy.json');
//    final useDevicePreview = annotation.read('useDevicePreview').boolValue;
//    final framyConfig = await loadFramyConfig()
//      ..useDevicePreview = useDevicePreview;

    final buffer = StringBuffer();
    buffer.writeln(generateLintIgnores());
    buffer.writeln(generateImports(
      [
        ...themeFramyObjects,
        ...widgetFramyObjects,
        ...modelFramyObjects,
        ...presetFramyObjects,
        ...riverpodFramyObjects,
      ],
      extraImports: [
        'package:flutter_test/flutter_test.dart',
        'package:flutter/services.dart',
        'dart:io',
        'dart:ui',
        pathToFramyApp,
      ],
    ));
    buffer.writeln(generateTests(widgetFramyObjects, presetFramyObjects));
    buffer.writeln(generateTestUtils(themeFramyObjects));
    return buffer.toString();
  }
}
