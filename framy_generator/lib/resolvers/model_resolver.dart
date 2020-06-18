import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:framy_annotation/framy_annotation.dart';
import 'package:framy_generator/framy_object.dart';
import 'package:source_gen/source_gen.dart';

class ModelResolver extends GeneratorForAnnotation<FramyModel> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    List<FramyObject> framyObjectsToReturn = [];
    final framyObject = _modelObjectFromElement(element);
    if (element is ClassElement) {
      framyObject.widgetDependencies = [];
      final constructor = element.unnamedConstructor;
      for (ParameterElement param in constructor.parameters) {
        framyObject.widgetDependencies.add(
          FramyWidgetDependency(
            param.name,
            parseDartType(param.type),
            param.defaultValueCode,
            param.isNamed,
          ),
        );
      }
    }

    framyObjectsToReturn.add(framyObject);

    var encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(
        framyObjectsToReturn.map((framyObj) => framyObj.toMap()).toList());
  }

  String parseDartType(DartType type) {
    final stringType = type.toString();
    if (stringType == 'num') {
      return 'double';
    }
    return stringType;
  }

  FramyObject _modelObjectFromElement(Element element) =>
      FramyObject.fromElement(element)..type = FramyObjectType.model;
}
