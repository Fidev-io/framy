import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:framy_annotation/framy_annotation.dart';
import 'package:framy_generator/framy_generator.dart';
import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/json_formatter.dart';
import 'package:source_gen/source_gen.dart';

const providerChecker = TypeChecker.fromRuntime(FramyUseProvider);
const riverpodChecker = TypeChecker.fromRuntime(FramyUseRiverpod);

class WidgetResolver extends GeneratorForAnnotation<FramyWidget> {
  List<FramyObject> riverpodFramyObjects;

  @override
  FutureOr<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    final framyObjectsToReturn = <FramyObject>[];
    final isPage = annotation.read('isPage').boolValue;
    final framyObject = _widgetObjectFromElement(element, isPage: isPage);
    if (element is ClassElement) {
      framyObject.constructors = [];
      //get constructor dependencies
      framyObject.constructors.add(FramyObjectConstructor('', []));
      final constructor = element.unnamedConstructor;
      for (final param in constructor.parameters) {
        if (param.type.toString() == 'Key') {
          continue;
        }
        framyObject.constructors.first.dependencies.add(
          FramyObjectDependency(
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
        framyObject.constructors.first.dependencies.add(
          FramyObjectDependency(
            providerType.getDisplayString(),
            providerType.getDisplayString(),
            null,
            false,
            dependencyType: FramyDependencyType.provider,
          ),
        );
      }

      //get riverpod dependencies
      if (riverpodChecker.hasAnnotationOf(element)) {
        riverpodFramyObjects ??=
            await loadFramyObjects(buildStep, '**.riverpod.framy.json');

        final providerAnnotation = riverpodChecker.firstAnnotationOf(element);
        final riverpodReader = ConstantReader(providerAnnotation);
        final riverpodName = riverpodReader.read('providerName').stringValue;
        final riverpodType = riverpodFramyObjects
                .singleWhere(
                  (riverpodObj) => riverpodObj.name == riverpodName,
                  orElse: () => null,
                )
                ?.returnType ??
            'Null';
        framyObject.constructors.first.dependencies.add(
          FramyObjectDependency(
            riverpodName,
            riverpodType,
            null,
            false,
            dependencyType: FramyDependencyType.riverpod,
          ),
        );
      }

      //add groupName
      framyObject.widgetGroupName = annotation.peek('groupName')?.stringValue;
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

  FramyObject _widgetObjectFromElement(Element element,
          {bool isPage = false}) =>
      FramyObject.fromElement(element)
        ..type = isPage ? FramyObjectType.page : FramyObjectType.widget;
}
