import 'package:framy_generator/framy_object.dart';

String generateModelConstructorMap(List<FramyObject> modelObjects) {
  final models = modelObjects
      .where((element) => element.type == FramyObjectType.model)
      .toList();
  return '''
final framyModelConstructorMap =
    <String, dynamic Function(FramyDependencyModel)>{
  ...framyEnumMap.map((type, values) => MapEntry(type, (FramyDependencyModel dep) => values.first)),
  ${models.fold('', (previousValue, model) => previousValue + _generateModelConstructor(model))}
  'String': (dep) => '',
  'double': (dep) => 0.0,
  'int': (dep) => 0,
  'bool': (dep) => false,
};
''';
}

String _generateModelConstructor(FramyObject model) {
  return ''''${model.name}': (dep) => ${model.name}(
    ${model.widgetDependencies.fold('', (s, dep) => s + _generateParamUsageInConstructor(dep))}),
''';
}

String _generateParamUsageInConstructor(FramyWidgetDependency dependency) {
  final nameInConstructor = dependency.isNamed ? '${dependency.name}: ' : '';
  return '${nameInConstructor}dep.subDependencies.singleWhere((d) => d.name == \'${dependency.name}\').value,\n';
}
