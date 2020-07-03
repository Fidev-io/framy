import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/utils.dart';

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
  ${constructorDependencies.fold('', (s, dep) => s + _generateParamUsageInConstructor(dep))}
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
        return ${_wrapConstructorWithProvider(constructor, providerDependencies)};
      },
    );
  }
}
''';
}

String _wrapConstructorWithProvider(
    String constructor, List<FramyObjectDependency> providerDependencies) {
  if (providerDependencies.isEmpty) {
    return constructor;
  } else {
    return '''
      MultiProvider(
        providers: [
          ${providerDependencies.fold('', (prev, dep) => prev + _providerDependencyToProviderWidget(dep))}
        ],
        child: $constructor,
      )''';
  }
}

String _providerDependencyToProviderWidget(FramyObjectDependency dependency) =>
    'Provider<${dependency.type}>.value(value: valueGetter(\'${dependency.name}\')),\n';

String _generateParamUsageInConstructor(FramyObjectDependency dependency) {
  final nameInConstructor = dependency.isNamed ? '${dependency.name}: ' : '';
  return '${nameInConstructor}valueGetter(\'${dependency.name}\'),\n';
}
