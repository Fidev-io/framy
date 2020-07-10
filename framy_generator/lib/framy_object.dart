import 'package:analyzer/dart/element/element.dart';
import 'package:framy_generator/utils.dart';

export 'package:analyzer/dart/element/element.dart';

class FramyObject {
  FramyObjectType type;
  String import;
  String name;
  bool isStatic;
  ElementKind kind;
  FramyObject parentObject;
  List<FramyObjectConstructor> constructors;
  String returnType;
  List<String> imports;

  FramyObject();

  FramyObject.fromElement(Element element)
      : import = getImport(element),
        name = element.displayName,
        kind = element.kind,
        isStatic = (element is ExecutableElement && element.isStatic) ||
            (element is FieldElement && element.isStatic),
        imports = element.library.importedLibraries
            .map((lib) => lib.location.toString())
            .toList();

  Map<String, dynamic> toMap() {
    return {
      'type': type?.toString(),
      'import': import,
      'imports': imports,
      'name': name,
      'isStatic': isStatic,
      'kind': kind.toString(),
      if (parentObject != null) 'parentObject': parentObject.toMap(),
      if (constructors != null)
        'constructors': constructors.map((con) => con.toMap()).toList(),
      if (returnType != null) 'returnType': returnType,
    };
  }

  FramyObject.fromJson(Map<String, dynamic> json) {
    type = FramyObjectType.values.singleWhere(
      (type) => type?.toString() == json['type'],
      orElse: () => null,
    );
    import = json['import'];
    name = json['name'];
    isStatic = json['isStatic'];
    kind = ElementKind.values
        .singleWhere((kind) => kind.toString() == json['kind']);
    parentObject = json['parentObject'] == null
        ? null
        : FramyObject.fromJson(json['parentObject']);
    constructors = json['constructors'] == null
        ? null
        : (json['constructors'] as List)
            .map((map) => FramyObjectConstructor.fromJson(map))
            .toList();
    returnType = json['returnType'];
    imports = List.from(json['imports'] ?? []);
  }
}

class FramyObjectDependency {
  final String name;
  final String type;
  final String defaultValueCode;
  final bool isNamed;
  final FramyDependencyType dependencyType;

  FramyObjectDependency(
      this.name, this.type, this.defaultValueCode, this.isNamed,
      {this.dependencyType = FramyDependencyType.constructor});

  FramyObjectDependency.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        defaultValueCode = json['defaultValue'],
        type = json['type'],
        isNamed = json['isNamed'],
        dependencyType = FramyDependencyType.values
            .singleWhere((type) => type.toString() == json['dependencyType']);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'type': type,
      'defaultValue': defaultValueCode,
      'isNamed': isNamed,
      'dependencyType': dependencyType.toString(),
    };
  }
}

class FramyObjectConstructor {
  final String name;
  final List<FramyObjectDependency> dependencies;

  FramyObjectConstructor(this.name, this.dependencies);

  FramyObjectConstructor.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        dependencies = json['dependencies'] == null
            ? null
            : (json['dependencies'] as List)
                .map((map) => FramyObjectDependency.fromJson(map))
                .toList();

  Map<String, dynamic> toMap() => {
        'name': name,
        if (dependencies != null)
          'dependencies': dependencies?.map((dep) => dep.toMap())?.toList(),
      };
}

enum FramyObjectType {
  themeData,
  color,
  widget,
  model,
  preset,
  enumModel,
  riverpod,
}

enum FramyDependencyType { constructor, provider, riverpod }
