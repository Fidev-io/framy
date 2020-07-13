import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/utils.dart';
import 'package:framy_generator/generator/widget_dependency_utils.dart';

String generateWidgetPages(
    List<FramyObject> widgetFramyObjects, List<FramyObject> modelFramyObjects) {
  return widgetFramyObjects.fold(
    '',
    (previousValue, element) => previousValue + _generateWidgetPage(element),
  );
}

String _generateWidgetPage(FramyObject framyObject) {
  final constructorDependencies = framyObject.constructors.first.dependencies
      .where((dep) => dep.dependencyType == FramyDependencyType.constructor)
      .toList();
  final providerDependencies = framyObject.constructors.first.dependencies
      .where((dep) => dep.dependencyType == FramyDependencyType.provider)
      .toList();

  final constructor = '''${framyObject.name}(
  ${constructorDependencies.fold('', (s, dep) => s + generateParamUsageInConstructor(dep))}
  )''';

  final className = 'Framy${framyObject.name}CustomPage';
  final key = 'Framy_${framyObject.name}_Page';

  return '''
class $className extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FramyCustomPage(
      key: Key('$key'),
      dependencies: [
        ${framyObject.constructors.first.dependencies.fold('', (s, dep) => s + dependencyInitializationLine(dep))}
      ],
      builder: (DependencyValueGetter valueGetter) {
        return ${wrapConstructorWithProvider(constructor, providerDependencies)};
      },
    );
  }
}
''';
}
