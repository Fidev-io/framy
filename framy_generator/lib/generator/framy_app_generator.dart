import 'package:framy_generator/framy_object.dart';

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
    return 'theme: ${themeObjects.first.name}(),';
  }
}
