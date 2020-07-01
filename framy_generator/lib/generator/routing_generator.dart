import 'package:framy_generator/framy_object.dart';

String generateRouting(List<FramyObject> widgetFramyObjects) => '''
Route onGenerateRoute(RouteSettings settings) {
  final routes = {
    '/typography': FramyFontsPage(),
    '/colors': FramyColorsPage(),
    '/appbar': FramyAppBarPage(),
    '/button': FramyButtonPage(),
    '/toggle': FramyTogglePage(),
    ${_generateCustomWidgetPages(widgetFramyObjects)}
  };
  final page = routes[settings.name] ?? FramyFontsPage();
  return PageRouteBuilder<dynamic>(
    pageBuilder: (_, __, ___) => FramyLayoutTemplate(child: page),
    settings: settings,
  );
}
''';
String _generateCustomWidgetPages(List<FramyObject> widgetObjects) {
  String result = '';
  widgetObjects
      .where((framyObject) => framyObject.type == FramyObjectType.widget)
      .forEach(
    (widgetFramyObject) {
      final className = widgetFramyObject.name;
      final pageName = 'Framy${className}CustomPage';
      result += '\'/$className\': $pageName(),';
    },
  );
  return result;
}
