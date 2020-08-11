import 'package:framy_generator/framy_object.dart';

String dependencyInitializationLine(FramyObjectDependency dependency) {
  final type = dependency.type;
  final name = dependency.name;
  final defaultValue = dependency.defaultValueCode;

  return 'FramyDependencyModel<$type>(\'$name\', \'$type\', $defaultValue),\n';
}
