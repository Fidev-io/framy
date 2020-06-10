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
    if (element.isPrivate) {
      throw InvalidGenerationSourceError(
        'Framy annotations cannot be applied to private methods',
        element: element,
      );
    }

    List<FramyObject> framyObjectsToReturn = [];

    if (element is ClassElement) {
      final parentObject = FramyObject.fromElement(element);

      final childrenElements = [
        ...element.accessors,
        ...element.methods,
      ];

      for (var execElement in childrenElements) {
        switch (execElement.returnType.getDisplayString()) {
          case 'ThemeData':
            framyObjectsToReturn
                .add(_themeDataObjectFromElement(execElement, parentObject));
            break;
        }
      }
    } else {
      final framyObject = _themeDataObjectFromElement(element);
      framyObjectsToReturn.add(framyObject);
    }

    var encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(
        framyObjectsToReturn.map((framyObj) => framyObj.toMap()).toList());
  }

  FramyObject _themeDataObjectFromElement(Element element,
          [FramyObject parent]) =>
      FramyObject.fromElement(element)
        ..type = FramyObjectType.themeData
        ..parentObject = parent;
}
