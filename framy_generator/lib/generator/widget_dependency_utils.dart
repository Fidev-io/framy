import 'package:framy_generator/framy_object.dart';

String wrapConstructorWithProvider(
    String constructor, List<FramyObjectDependency> providerDependencies) {
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