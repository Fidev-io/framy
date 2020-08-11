import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:framy_annotation/framy_annotation.dart';
import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/json_formatter.dart';
import 'package:source_gen/source_gen.dart';

class RegisterRiverpodResolver
    extends GeneratorForAnnotation<FramyRegisterRiverpod> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    final framyObjectsToReturn = <FramyObject>[];
    if (element is TopLevelVariableElement) {
      final framyObject = _riverpodObjectFromElement(element);
      final type = element.type.getDisplayString();
      framyObject.returnType = type.substring(
        type.indexOf('<') + 1,
        type.lastIndexOf('>'),
      );
      framyObjectsToReturn.add(framyObject);
    }
    return framyObjectsToReturn.toJson();
  }

  FramyObject _riverpodObjectFromElement(Element element) =>
      FramyObject.fromElement(element)..type = FramyObjectType.riverpod;
}
