import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/accessible_element_generator.dart';

String generateFramyApp([List<FramyObject> themeObjects]) => '''
class FramyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: Key('FramyApp'),
      ${_generateThemeDataLine(themeObjects)}
      onGenerateRoute: onGenerateRoute,
    );
  }
}
''';

String _generateThemeDataLine(List<FramyObject> themeObjects) {
  if (themeObjects == null || themeObjects.isEmpty) {
    return '';
  } else {
    final themeObject = themeObjects
        .firstWhere((object) => object.type == FramyObjectType.themeData);
    return 'theme: ${generateAccessibleElement(themeObject)},';
  }
}
