import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:framy_annotation/framy_annotation.dart';
import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/json_formatter.dart';
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

    final framyObjectsToReturn = <FramyObject>[];

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
          case 'Color':
          case 'MaterialColor':
          case 'MaterialAccentColor':
            framyObjectsToReturn
                .add(_colorObjectFromElement(execElement, parentObject));
            break;
        }
      }
    } else {
      final framyObject = _themeDataObjectFromElement(element);
      framyObjectsToReturn.add(framyObject);
    }

    return framyObjectsToReturn.toJson();
  }

  FramyObject _themeDataObjectFromElement(Element element,
          [FramyObject parent]) =>
      FramyObject.fromElement(element)
        ..type = FramyObjectType.themeData
        ..parentObject = parent;

  FramyObject _colorObjectFromElement(Element element, [FramyObject parent]) =>
      FramyObject.fromElement(element)
        ..type = FramyObjectType.color
        ..parentObject = parent;
}
