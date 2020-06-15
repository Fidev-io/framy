import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
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
    framyObjectsToReturn.add(framyObject);

    var encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(
        framyObjectsToReturn.map((framyObj) => framyObj.toMap()).toList());
  }

  FramyObject _widgetObjectFromElement(Element element) =>
      FramyObject.fromElement(element)..type = FramyObjectType.widget;
}
