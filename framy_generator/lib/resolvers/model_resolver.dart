import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:framy_annotation/framy_annotation.dart';
import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/json_formatter.dart';
import 'package:source_gen/source_gen.dart';

class ModelResolver extends GeneratorForAnnotation<FramyModel> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    List<FramyObject> framyObjectsToReturn = [];
    final framyObject = _modelObjectFromElement(element);
    if (element is ClassElement) {
      framyObject.constructors = [];
      if (element.isEnum) {
        framyObject.type = FramyObjectType.enumModel;
      } else {
        for (ConstructorElement constructorElement in element.constructors) {
          String constructorName = constructorElement.name;
          if (constructorName.isNotEmpty) {
            constructorName = '.$constructorName';
          }
          framyObject.constructors
              .add(FramyObjectConstructor(constructorName, []));
          for (ParameterElement param in constructorElement.parameters) {
            framyObject.constructors.first.dependencies.add(
              FramyObjectDependency(
                param.name,
                parseDartType(param.type),
                param.defaultValueCode,
                param.isNamed,
              ),
            );
          }
        }
      }
    }

    framyObjectsToReturn.add(framyObject);

    return framyObjectsToReturn.toJson();
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
