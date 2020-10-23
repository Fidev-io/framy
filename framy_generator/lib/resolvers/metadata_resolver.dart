import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:framy_annotation/framy_annotation.dart';
import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/utils.dart';
import 'package:source_gen/source_gen.dart';

class MetadataResolver extends GeneratorForAnnotation<FramyApp> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    final pathToFramyApp =
        getImport(element).replaceFirst('\.dart', '\.app\.framy\.dart');
    return json.encode({
      'pathToFramyApp': pathToFramyApp,
    });
  }
}
