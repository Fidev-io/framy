//import 'package:framy_generator/framy_object.dart';
//import 'package:framy_generator/generator/accessible_element_generator.dart';
//
//String generateGalleryApp(FramyObject framyThemeDataObject) => '''
//class FramyGalleryApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Framy Gallery App',
//      ${_themeLine(framyThemeDataObject)}
//      onGenerateRoute: generateRoute,
//    );
//  }
//}''';
//
//String _themeLine(FramyObject framyThemeDataObject) {
//  if (framyThemeDataObject == null) {
//    return '';
//  } else {
//    String theme = 'theme: ';
//    theme += generateAccessibleElement(framyThemeDataObject);
//    theme += ',';
//    return theme;
//  }
//}
