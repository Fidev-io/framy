import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/widget_dependency_utils.dart';

String generateWidgetPages(List<FramyObject> widgetFramyObjects) {
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
  final riverpodDependencies = framyObject.constructors.first.dependencies
      .where((dep) => dep.dependencyType == FramyDependencyType.riverpod)
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
        ${initializeFramyObjectDependencies(framyObject)}
      ],
      builder: (DependencyValueGetter valueGetter) {
        return ${_wrapConstructor(constructor, providerDependencies, riverpodDependencies)};
      },
    );
  }
}
''';
}

String _wrapConstructor(
  String constructor,
  List<FramyObjectDependency> providerDependencies,
  List<FramyObjectDependency> riverpodDependencies,
) {
  constructor = _wrapConstructorWithProvider(constructor, providerDependencies);
  constructor = _wrapConstructorWithRiverpod(constructor, riverpodDependencies);
  return constructor;
}

String _wrapConstructorWithRiverpod(
    String constructor, List<FramyObjectDependency> riverpodDependencies) {
  if (riverpodDependencies.isEmpty) {
    return constructor;
  } else {
    return '''
      ProviderScope(
        overrides: [
          ${riverpodDependencies.fold('', (prev, dep) => prev + _riverpodDependencyToProviderWidget(dep))}
        ],
        child: $constructor,
      )''';
  }
}

String _wrapConstructorWithProvider(
    String constructor, List<FramyObjectDependency> providerDependencies) {
  if (providerDependencies.isEmpty) {
    return constructor;
  } else {
    return '''
      provider.MultiProvider(
        providers: [
          ${providerDependencies.fold('', (prev, dep) => prev + _providerDependencyToProviderWidget(dep))}
        ],
        child: $constructor,
      )''';
  }
}

String _riverpodDependencyToProviderWidget(FramyObjectDependency dependency) =>
    '${dependency.name}.overrideAs(Provider((_) => valueGetter(\'${dependency.name}\'))),\n';

String _providerDependencyToProviderWidget(FramyObjectDependency dependency) =>
    'provider.Provider<${dependency.type}>.value(value: valueGetter(\'${dependency.name}\')),\n';

String _generateParamUsageInConstructor(FramyObjectDependency dependency) {
  final nameInConstructor = dependency.isNamed ? '${dependency.name}: ' : '';
  return '${nameInConstructor}valueGetter(\'${dependency.name}\'),\n';
}
