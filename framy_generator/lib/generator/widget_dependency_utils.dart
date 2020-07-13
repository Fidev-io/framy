import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/utils.dart';

String wrapConstructorWithProvider(FramyObject framyObject) {
  final constructorDependencies = framyObject.constructors.first.dependencies
      .where((dep) => dep.dependencyType == FramyDependencyType.constructor)
      .toList();
  final providerDependencies = framyObject.constructors.first.dependencies
      .where((dep) => dep.dependencyType == FramyDependencyType.provider)
      .toList();

  final constructor = '''${framyObject.name}(
  ${constructorDependencies.fold('', (s, dep) => s + generateParamUsageInConstructor(dep))}
  )''';

  if (providerDependencies.isEmpty) {
    return constructor;
  } else {
    return '''
      MultiProvider(
        providers: [
          ${providerDependencies.fold('', (prev, dep) => prev + providerDependencyToProviderWidget(dep))}
        ],
        child: $constructor,
      )''';
  }
}

String providerDependencyToProviderWidget(FramyObjectDependency dependency) =>
    'Provider<${dependency.type}>.value(value: valueGetter(\'${dependency.name}\')),\n';

String generateParamUsageInConstructor(FramyObjectDependency dependency) {
  final nameInConstructor = dependency.isNamed ? '${dependency.name}: ' : '';
  return '${nameInConstructor}valueGetter(\'${dependency.name}\'),\n';
}

String initializeFramyObjectDependencies (FramyObject framyObject) {
  return framyObject.constructors.first.dependencies.fold('', (s, dep) => s + dependencyInitializationLine(dep));
}
