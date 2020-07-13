import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:framy_annotation/framy_annotation.dart';
import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/app_bar_generator.dart';
import 'package:framy_generator/generator/app_bar_page_generator.dart';
import 'package:framy_generator/generator/available_constructor_names_generator.dart';
import 'package:framy_generator/generator/button_page_generator.dart';
import 'package:framy_generator/generator/colors_page_generator.dart';
import 'package:framy_generator/generator/constructor_dropdown_generator.dart';
import 'package:framy_generator/generator/datetime_dependency_input_generator.dart';
import 'package:framy_generator/generator/dependency_model_generator.dart';
import 'package:framy_generator/generator/drawer_generator.dart';
import 'package:framy_generator/generator/enum_map_generator.dart';
import 'package:framy_generator/generator/fonts_page_generator.dart';
import 'package:framy_generator/generator/framy_app_generator.dart';
import 'package:framy_generator/generator/imports_generator.dart';
import 'package:framy_generator/generator/layout_template_generator.dart';
import 'package:framy_generator/generator/main_generator.dart';
import 'package:framy_generator/generator/model_constructor_map_generator.dart';
import 'package:framy_generator/generator/preset_dropdown_generator.dart';
import 'package:framy_generator/generator/presets_map_generator.dart';
import 'package:framy_generator/generator/routing_generator.dart';
import 'package:framy_generator/generator/storyboard_generator.dart';
import 'package:framy_generator/generator/subdependencies_map_generator.dart';
import 'package:framy_generator/generator/text_field_generator.dart';
import 'package:framy_generator/generator/toggle_page_generator.dart';
import 'package:framy_generator/generator/utils_generator.dart';
import 'package:framy_generator/generator/widget_cutom_page_template_generator.dart';
import 'package:framy_generator/generator/widget_dependencies_panel_generator.dart';
import 'package:framy_generator/generator/widget_dependency_input_generator.dart';
import 'package:framy_generator/generator/widget_list_dependency_input_generator.dart';
import 'package:framy_generator/generator/widget_page_generator.dart';
import 'package:glob/glob.dart';
import 'package:source_gen/source_gen.dart';

class FramyGenerator extends GeneratorForAnnotation<FramyApp> {
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
    final useDevicePreview = annotation.read('useDevicePreview').boolValue;

    final buffer = StringBuffer();
    buffer.writeln(generateImports([
      ...themeFramyObjects,
      ...widgetFramyObjects,
      ...modelFramyObjects,
      ...presetFramyObjects,
      ...riverpodFramyObjects,
    ], useDevicePreview: useDevicePreview));
    buffer.writeln(generateMain(riverpodFramyObjects.isNotEmpty));
    buffer.writeln(generateFramyApp(themeFramyObjects));
    buffer.writeln(generateRouting(widgetFramyObjects));
    buffer.writeln(generateLayoutTemplate());
    buffer.writeln(generateAppBar());
    buffer.writeln(generateDrawer(widgetFramyObjects));
    buffer.writeln(
        '\n// ======================== MATERIAL PAGES ===========================\n');
    buffer.writeln(generateFontsPage());
    buffer.writeln(generateColorsPage(themeFramyObjects));
    buffer.writeln(generateUtils());
    buffer.writeln(generateAppBarPage());
    buffer.writeln(generateButtonPage());
    buffer.writeln(generateTogglePage());
    buffer.writeln(generateTextFieldPage());
    buffer.writeln(
        '\n// ======================== CUSTOM PAGES ===========================\n');
    buffer.writeln(generateCustomPage(useDevicePreview));
    buffer.writeln(generateWidgetPages(widgetFramyObjects));
    buffer.writeln(generateDependencyModel());
    buffer.writeln(generateWidgetDependenciesPanel());
    buffer.writeln(generateStoryboardPage(widgetFramyObjects, modelFramyObjects));
    buffer.writeln(
        '\n// ======================== DEPENDENCY INPUTS ===========================\n');
    buffer.writeln(generateWidgetDependencyInput(modelFramyObjects));
    buffer.writeln(generateDateTimeDependencyInput());
    buffer.writeln(generateWidgetListDependencyInput(modelFramyObjects));
    buffer.writeln(generatePresetDropdown());
    buffer.writeln(generateConstructorDropdown());
    buffer.writeln(
        '\n// ======================== MAPS etc ===========================\n');
    buffer.writeln(generateModelConstructorMap(modelFramyObjects));
    buffer.writeln(generateEnumMap(modelFramyObjects));
    buffer.writeln(generateSubDependenciesMap(modelFramyObjects));
    buffer.writeln(generateAvailableConstructorNames(modelFramyObjects));
    buffer.writeln(generatePresets(presetFramyObjects));
    return buffer.toString();
  }
}

Future<List<FramyObject>> loadFramyObjects(
  BuildStep buildStep,
  String extension,
) async {
  //workaround for tests:
  if (buildStep == null) {
    return [];
  }
  final glob = Glob(extension);
  List<FramyObject> framyObjects = [];
  await for (final id in buildStep.findAssets(glob)) {
    List jsons = jsonDecode(await buildStep.readAsString(id));
    framyObjects
        .addAll(jsons.map((json) => FramyObject.fromJson(json)).toList());
  }
  return framyObjects;
}
