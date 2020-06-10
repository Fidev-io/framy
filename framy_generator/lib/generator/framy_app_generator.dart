import 'package:framy_generator/framy_object.dart';

String generateFramyApp({FramyObject themeData}) => '''
class FramyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: Key('FramyApp'),
      ${_generateThemeDataLine(themeData)}
      onGenerateRoute: onGenerateRoute,
    );
  }
}
''';

String _generateThemeDataLine(FramyObject themeData) {
  if (themeData == null) {
    return '';
  } else {
    return 'theme: ${themeData.name}(),';
  }
}
