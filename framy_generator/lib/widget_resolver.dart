import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:framy_annotation/framy_annotation.dart';
import 'package:framy_generator/framy_object.dart';
import 'package:source_gen/source_gen.dart';

class WidgetResolver extends GeneratorForAnnotation<FramyWidget> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    List<FramyObject> framyObjectsToReturn = [];
    final framyObject = _widgetObjectFromElement(element);
    if (element is ClassElement) {
      framyObject.widgetDependencies = [];
      final constructor = element.unnamedConstructor;
      for (ParameterElement param in constructor.parameters) {
        if (param.type.toString() == 'Key') {
          continue;
        }
        framyObject.widgetDependencies.add(
          FramyWidgetDependency(
            param.name,
            parseDartType(param.type),
            null,
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

  FramyWidgetDependencyType parseDartType(DartType type) {
    switch (type.toString()) {
      case 'String':
        return FramyWidgetDependencyType.string;
      //TODO: Handle other cases and throw error when unsupported
      default:
        return FramyWidgetDependencyType.string;
    }
  }

  FramyObject _widgetObjectFromElement(Element element) =>
      FramyObject.fromElement(element)..type = FramyObjectType.widget;
}
