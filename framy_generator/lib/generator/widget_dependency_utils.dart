import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/utils.dart';

String wrapConstructor(FramyObject framyObject) {
  final constructorDependencies = framyObject.constructors.first.dependencies
      .where((dep) => dep.dependencyType == FramyDependencyType.constructor)
      .toList();
  final providerDependencies = framyObject.constructors.first.dependencies
      .where((dep) => dep.dependencyType == FramyDependencyType.provider)
      .toList();
  final riverpodDependencies = framyObject.constructors.first.dependencies
      .where((dep) => dep.dependencyType == FramyDependencyType.riverpod)
      .toList();

  var constructor = '''${framyObject.name}(
  ${constructorDependencies.fold('', (s, dep) => s + generateParamUsageInConstructor(dep))}
  )''';

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

String providerDependencyToProviderWidget(FramyObjectDependency dependency) =>
    'Provider<${dependency.type}>.value(value: valueGetter(\'${dependency.name}\')),\n';

String generateParamUsageInConstructor(FramyObjectDependency dependency) {
  final nameInConstructor = dependency.isNamed ? '${dependency.name}: ' : '';
  return '${nameInConstructor}valueGetter(\'${dependency.name}\'),\n';
}

String initializeFramyObjectDependencies(FramyObject framyObject) {
  return framyObject.constructors.first.dependencies
      .fold('', (s, dep) => s + dependencyInitializationLine(dep));
}
