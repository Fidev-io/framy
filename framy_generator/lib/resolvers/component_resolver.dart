//import 'package:analyzer/dart/constant/value.dart';
//import 'package:framy_generator/framy_object.dart';
//import 'package:source_gen/source_gen.dart';
//
////const TypeChecker defaultsChecker = TypeChecker.fromRuntime(FramyDefaults);
//
//List<FramyObject> resolveComponent(
//    ClassElement classElement, DartObject componentAnnotation) {
//  List<FramyObject> framyObjects = [];
//  final configs = componentAnnotation.getField('configs').toListValue();
//  final page = componentAnnotation.getField('page').toStringValue();
//  final extraImports =
//      componentAnnotation.getField('extraImports').toListValue();
//  final extraImportsStr = extraImports?.map(
//          (DartObject importObj) => ConstantReader(importObj).stringValue) ??
//      [];
//
//  for (var config in configs) {
//    final reader = ConstantReader(config);
//    final configStr = reader.stringValue;
//    final framyObject = FramyObject.fromElement(classElement)
//      ..type = FramyObjectType.widget
//      ..constructor = configStr
//      ..page = page ?? classElement.displayName
//      ..group = classElement.displayName;
//    framyObject.dependencyImports.addAll(extraImportsStr);
//    framyObjects.add(framyObject);
//  }
//
//  return framyObjects;
//}
