import 'dart:async';
import 'dart:convert';

import 'package:build/build.dart';
import 'package:framy_annotation/framy_annotation.dart';
import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/resolvers/component_resolver.dart';
import 'package:framy_generator/resolvers/theme_data_resolver.dart';
import 'package:framy_generator/resolvers/theme_resolver.dart';
import 'package:framy_generator/resolvers/widgets_resolver.dart';
import 'package:source_gen/source_gen.dart';

const TypeChecker themeDataChecker = TypeChecker.fromRuntime(FramyThemeData);
const TypeChecker themeChecker = TypeChecker.fromRuntime(FramyTheme);
const TypeChecker widgetChecker = TypeChecker.fromRuntime(FramyWidget);
const TypeChecker widgetsChecker = TypeChecker.fromRuntime(FramyWidgets);
const TypeChecker pageNameChecker = TypeChecker.fromRuntime(FramyPageName);

class FramyDependencyGenerator implements Generator {
  @override
  FutureOr<String> generate(LibraryReader library, BuildStep buildStep) async {
    List<FramyObject> framyObjects = [];
    //Checks for first instance methods annotated with @FramyThemeData
    for (final annotatedElement in library.annotatedWith(themeDataChecker)) {
      framyObjects.add(resolveThemeData(annotatedElement));
    }
    //See all classes
    for (final classElement in library.classes) {
      if (themeChecker.hasAnnotationOfExact(classElement)) {
        //Class annotated with @FramyTheme (should be one)
        framyObjects.addAll(resolveTheme(classElement));
      }
      if (widgetsChecker.hasAnnotationOfExact(classElement)) {
        framyObjects.addAll(resolveWidgets(classElement));
      } else if (widgetChecker.hasAnnotationOfExact(classElement)) {
        framyObjects.addAll(resolveComponent(
          classElement,
          widgetChecker.firstAnnotationOf(classElement),
        ));
      }
    }
    if (framyObjects.isNotEmpty) {
      final inputID = buildStep.inputId.changeExtension(".framy.json");
      buildStep.writeAsString(
          inputID, json.encode(framyObjects.map((fo) => fo.toJson()).toList()));
    }
    return null;
  }
}
