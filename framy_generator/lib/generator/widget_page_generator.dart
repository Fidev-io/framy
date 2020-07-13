import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/widget_dependency_utils.dart';

String generateWidgetPages(List<FramyObject> widgetFramyObjects) {
  return widgetFramyObjects.fold(
    '',
    (previousValue, element) => previousValue + _generateWidgetPage(element),
  );
}

String _generateWidgetPage(FramyObject framyObject) {

  final className = 'Framy${framyObject.name}CustomPage';
  final key = 'Framy_${framyObject.name}_Page';

  return '''
class $className extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FramyCustomPage(
      key: Key('$key'),
      dependencies: [
        ${initializeFramyObjectDependencies(framyObject)}
      ],
      builder: (DependencyValueGetter valueGetter) {
        return ${wrapConstructor(framyObject)};
      },
    );
  }
}
''';
}

