import 'package:framy_generator/framy_object.dart';

String dependencyInitializationLine(FramyObjectDependency dependency) {
  final String type = dependency.type;
  final String name = dependency.name;
  final String defaultValue = dependency.defaultValueCode;

  return 'FramyDependencyModel<$type>(\'$name\', \'$type\', $defaultValue),\n';
}
