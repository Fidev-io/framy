import 'package:framy_generator/framy_object.dart';

String generateModelConstructorMap(List<FramyObject> modelObjects) {
  final models = modelObjects
      .where((element) => element.type == FramyObjectType.model)
      .toList();
  return '''
final framyModelConstructorMap =
    <String, dynamic Function(FramyDependencyModel)>{
  ...framyEnumMap.map((type, values) => MapEntry(type, (FramyDependencyModel dep) => values.first)),
  ${models.fold('', (previousValue, model) => previousValue + _generateModelConstructors(model))}
  'String': (dep) => '',
  'double': (dep) => 0.0,
  'int': (dep) => 0,
  'bool': (dep) => false,
};
''';
}

String _generateModelConstructors(FramyObject model) {
  return ''''${model.name}': (dep) {
    ${model.constructors.fold('', (prev, cons) => prev + _generateModelConstructor(model, cons))}
    else return null;
  },
''';
}

String _generateModelConstructor(
    FramyObject model, FramyObjectConstructor constructor) {
  return '''if (dep.constructor == \'${constructor.name}\') {
  return ${model.name + constructor.name}(
    ${_generateConstructorBody(model, constructor)}
  }
''';
}

String _generateConstructorBody(
    FramyObject model, FramyObjectConstructor constructor) {
  if (constructor.isBuiltValue) {
    return "(b) => b${constructor.dependencies.fold('', (s, dep) => s + "..${dep.name} = ${_dependencyValue(dep.name)}\n")});";
  } else {
    return "${constructor.dependencies.fold('', (s, dep) => s + _generateParamUsageInConstructor(dep))});";
  }
}

String _generateParamUsageInConstructor(FramyObjectDependency dependency) {
  final nameInConstructor = dependency.isNamed ? '${dependency.name}: ' : '';
  return '${nameInConstructor}${_dependencyValue(dependency.name)},\n';
}

String _dependencyValue(String name) {
  return 'dep.subDependencies.singleWhere((d) => d.name == \'$name\').value';
}
