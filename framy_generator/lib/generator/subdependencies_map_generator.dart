import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/utils.dart';

String generateSubDependenciesMap(List<FramyObject> modelObjects) {
  final models = modelObjects
      .where((element) => element.type == FramyObjectType.model)
      .toList();
  return '''
List<FramyDependencyModel> createSubDependencies(String type) {
  switch (type) {
    ${models.fold('', (prev, model) => prev + _generateForModel(model))}
    default:
      return [];
  }
}

''';
}

String _generateForModel(FramyObject object) {
  return '''
  case '${object.name}':
    return [
      ${object.widgetDependencies.fold('', (prev, dep) => prev + dependencyInitializationLine(dep))}
    ];
  ''';
}
