import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:framy_annotation/framy_annotation.dart';
import 'package:framy_generator/framy_object.dart';
import 'package:source_gen/source_gen.dart';

class ThemeResolver extends GeneratorForAnnotation<FramyTheme> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    final framyObject = FramyObject.fromElement(element)
      ..type = FramyObjectType.themeData;
    var encoder = JsonEncoder.withIndent('  ');
    return encoder.convert([framyObject.toMap()]);
  }
}
