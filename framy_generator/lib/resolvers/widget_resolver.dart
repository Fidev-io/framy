import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:framy_annotation/framy_annotation.dart';
import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/json_formatter.dart';
import 'package:source_gen/source_gen.dart';

const providerChecker = TypeChecker.fromRuntime(FramyUseProvider);

class WidgetResolver extends GeneratorForAnnotation<FramyWidget> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    List<FramyObject> framyObjectsToReturn = [];
    final framyObject = _widgetObjectFromElement(element);
    if (element is ClassElement) {
      framyObject.widgetDependencies = [];
      //get constructor dependencies
      final constructor = element.unnamedConstructor;
      for (ParameterElement param in constructor.parameters) {
        if (param.type.toString() == 'Key') {
          continue;
        }
        framyObject.widgetDependencies.add(
          FramyWidgetDependency(
            param.name,
            parseDartType(param.type),
            param.defaultValueCode,
            param.isNamed,
          ),
        );
      }

      //get provider dependencies
      if (providerChecker.hasAnnotationOf(element)) {
        final providerAnnotation = providerChecker.firstAnnotationOf(element);
        final providerReader = ConstantReader(providerAnnotation);
        final providerType = providerReader.read('providerType').typeValue;
        framyObject.widgetDependencies.add(
          FramyWidgetDependency(
            providerType.getDisplayString(),
            providerType.getDisplayString(),
            null,
            false,
            dependencyType: FramyWidgetDependencyType.provider,
          ),
        );
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

  FramyObject _widgetObjectFromElement(Element element) =>
      FramyObject.fromElement(element)..type = FramyObjectType.widget;
}
