//import 'package:framy_generator/framy_object.dart';
//
//List<FramyObject> resolveTheme(ClassElement classElement) {
//  List<FramyObject> framyObjects = [];
//  final executableElements = [
//    ...classElement.methods,
//    ...classElement.accessors,
//  ];
//
//  FramyObject themeObject = FramyObject.fromElement(classElement)
//    ..type = FramyObjectType.theme;
//
//  framyObjects.add(themeObject);
//
//  for (var execElement in executableElements) {
//    switch (execElement.returnType.getDisplayString()) {
//      case 'ThemeData':
//        framyObjects.add(FramyObject.fromElement(execElement)
//          ..parentObject = themeObject
//          ..type = FramyObjectType.themeData);
//        break;
//      case 'Color':
//        framyObjects.add(FramyObject.fromElement(execElement)
//          ..parentObject = themeObject
//          ..type = FramyObjectType.color);
//        break;
//    }
//  }
//
//  return framyObjects;
//}
