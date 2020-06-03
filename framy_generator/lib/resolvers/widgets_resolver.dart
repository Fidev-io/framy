//import 'package:framy_generator/framy_dependency_generator.dart';
//import 'package:framy_generator/framy_object.dart';
//
//List<FramyObject> resolveWidgets(ClassElement classElement) {
//  List<FramyObject> framyObjects = [];
//  final executableElements = [
//    ...classElement.methods,
//    ...classElement.accessors,
//  ];
//
//  FramyObject widgetsParentObject = FramyObject.fromElement(classElement)
//    ..type = FramyObjectType.widgets;
//
//  framyObjects.add(widgetsParentObject);
//
//  for (var execElement in executableElements) {
//    if (execElement.isPrivate) {
//      print('Private element. Skipping...');
//      continue;
//    }
//    final type = execElement.returnType.getDisplayString();
//    final pageNameDartObject = pageNameChecker
//        .firstAnnotationOfExact(execElement, throwOnUnresolved: false);
//    final pageName =
//        pageNameDartObject?.getField('name')?.toStringValue() ?? type;
//    final widgetObject = FramyObject.fromElement(execElement)
//      ..parentObject = widgetsParentObject
//      ..type = FramyObjectType.widget
//      ..group = type
//      ..page = pageName;
//    framyObjects.add(widgetObject);
//  }
//
//  return framyObjects;
//}
