import 'package:framy_generator/config/framy_config.dart';
import 'package:framy_generator/framy_object.dart';

String generateRouting(List<FramyObject> widgetFramyObjects, FramyConfig framyConfig) => '''
Route onGenerateRoute(RouteSettings settings) {
  final routes = {
    '/typography': FramyFontsPage(),
    '/colors': FramyColorsPage(),
    ${_generateMaterialComponentPages(framyConfig)}
    ${_generateCustomWidgetPages(widgetFramyObjects)}
    ${framyConfig.showStoryboard ? "'/storyboard': FramyStoryboardPage()," : ""}
  };
  final page = routes[settings.name] ?? FramyFontsPage();
  return PageRouteBuilder<dynamic>(
    pageBuilder: (_, __, ___) => FramyLayoutTemplate(child: page),
    settings: settings,
  );
}
''';

String _generateMaterialComponentPages(FramyConfig framyConfig) {
  if (!framyConfig.showMaterialComponents) {
    return '';
  }
  return '''
'/appbar': FramyAppBarPage(),
'/button': FramyButtonPage(),
'/toggle': FramyTogglePage(),
'/textfield': FramyTextFieldPage(),
''';
}

String _generateCustomWidgetPages(List<FramyObject> widgetObjects) {
  var result = '';
  widgetObjects
      .where((framyObject) =>
          framyObject.type == FramyObjectType.widget ||
          framyObject.type == FramyObjectType.page)
      .forEach(
    (widgetFramyObject) {
      final className = widgetFramyObject.name;
      final pageName = 'Framy${className}CustomPage';
      result += '\'/$className\': $pageName(),';
    },
  );
  return result;
}
