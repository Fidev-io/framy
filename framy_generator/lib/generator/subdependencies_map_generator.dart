import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/utils.dart';

String generateSubDependenciesMap(List<FramyObject> modelObjects) {
  final models = modelObjects
      .where((element) => element.type == FramyObjectType.model)
      .toList();
  return '''
List<FramyDependencyModel> createSubDependencies(String type, [String constructor = '']) {
  switch (type + constructor) {
    ${models.fold('', (prev, model) => prev + _generateForModel(model))}
    default: return [];
  }
}

''';
}

String _generateForModel(FramyObject object) {
  return '''
${object.constructors.fold('', (prev, cons) => prev + _generateForConstructor(object, cons))}
''';
}

String _generateForConstructor(
    FramyObject object, FramyObjectConstructor constructor) {
  return '''
  case '${object.name + constructor.name}':
    return [
      ${constructor.dependencies.fold('', (prev, dep) => prev + dependencyInitializationLine(dep))}
    ];
  ''';
}
