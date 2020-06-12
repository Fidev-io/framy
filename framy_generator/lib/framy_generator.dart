import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:framy_annotation/framy_annotation.dart';
import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/app_bar_generator.dart';
import 'package:framy_generator/generator/app_bar_page_generator.dart';
import 'package:framy_generator/generator/colors_page_generator.dart';
import 'package:framy_generator/generator/drawer_generator.dart';
import 'package:framy_generator/generator/fonts_page_generator.dart';
import 'package:framy_generator/generator/framy_app_generator.dart';
import 'package:framy_generator/generator/imports_generator.dart';
import 'package:framy_generator/generator/layout_template_generator.dart';
import 'package:framy_generator/generator/main_generator.dart';
import 'package:framy_generator/generator/routing_generator.dart';
import 'package:framy_generator/generator/utils_generator.dart';
import 'package:glob/glob.dart';
import 'package:source_gen/source_gen.dart';

class FramyGenerator extends GeneratorForAnnotation<FramyApp> {
  final themeFramyObjectFiles = Glob("**.theme.framy.json");

  @override
  Future<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    List<FramyObject> themeFramyObjects = [];
    await for (final id in buildStep.findAssets(themeFramyObjectFiles)) {
      List jsons = jsonDecode(await buildStep.readAsString(id));
      themeFramyObjects
          .addAll(jsons.map((json) => FramyObject.fromJson(json)).toList());
    }

    final buffer = StringBuffer();
    buffer.writeln(generateImports(themeFramyObjects));
    buffer.writeln(generateMain());
    buffer.writeln(generateFramyApp(themeFramyObjects));
    buffer.writeln(generateRouting());
    buffer.writeln(generateLayoutTemplate());
    buffer.writeln(generateAppBar());
    buffer.writeln(generateDrawer());
    buffer.writeln(generateFontsPage());
    buffer.writeln(generateColorsPage(themeFramyObjects));
    buffer.writeln(generateAppBarPage());
    buffer.writeln(generateUtils());

    return buffer.toString();

//    final buffer = StringBuffer();
//    //imports
//    final imports = framyObjects
//        .expand((obj) => obj.dependencyImports..add(obj.import))
//        .toSet();
//    buffer.writeln(generateImports(imports));
//    //main
//    buffer.writeln(generateMain());
//    //gallery app
//    final themeDataObject = framyObjects.singleWhere(
//      (fo) => fo.type == FramyObjectType.themeData,
//      orElse: () => null,
//    );
//    buffer.writeln(generateGalleryApp(themeDataObject));
//    //static stuff
//    buffer.writeln(generateLayoutBuilder());
//    buffer.writeln(generateHomePage());
//    buffer.writeln(generateFontsPage());
//    buffer.writeln(generateMaterialComponentsPage());
//    //colors page
//    final colorObjects =
//        framyObjects.where((fo) => fo.type == FramyObjectType.color).toList();
//    buffer.writeln(generateColorsPage(colorObjects));
//    //dynamic pages
//    final pages = framyObjects.map((fo) => fo.page).toSet()..remove(null);
//    buffer.writeln(generatePageConfigs(framyObjects));
//    for (String page in pages) {
//      final componentsInPage =
//          framyObjects.where((fo) => fo.page == page).toList();
//      buffer.writeln(generateWidgetPage(componentsInPage));
//    }
  }
}
