import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:framy_annotation/framy_annotation.dart';
import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/json_formatter.dart';
import 'package:source_gen/source_gen.dart';

class PresetResolver extends GeneratorForAnnotation<FramyPreset> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    if (element.isPrivate) {
      throw InvalidGenerationSourceError(
        'Framy annotations cannot be applied to private methods',
        element: element,
      );
    } else if (element.kind != ElementKind.FUNCTION &&
        element.kind != ElementKind.METHOD) {
      throw InvalidGenerationSourceError(
        'Framy preset can be applied only to functions and methods',
        element: element,
      );
    }

    final execElement = element as ExecutableElement;
    final framyObject = _presetObjectFromElement(element);
    framyObject.returnType = execElement.returnType.getDisplayString();

    return [framyObject].toJson();
  }

  FramyObject _presetObjectFromElement(ExecutableElement element,
          [FramyObject parent]) =>
      FramyObject.fromElement(element)
        ..type = FramyObjectType.preset
        ..parentObject = parent;
}
