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
  List<FramyWidgetDependency> widgetDependencies;

  FramyObject();

  FramyObject.fromElement(Element element)
      : import = getImport(element),
        name = element.displayName,
        kind = element.kind,
        isStatic = (element is ExecutableElement && element.isStatic) ||
            (element is FieldElement && element.isStatic);

  Map<String, dynamic> toMap() {
    return {
      'type': type?.toString(),
      'import': import,
      'name': name,
      'isStatic': isStatic,
      'kind': kind.toString(),
      'parentObject': parentObject?.toMap(),
      'widgetDependencies':
          widgetDependencies?.map((dep) => dep.toMap())?.toList(),
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
    widgetDependencies = json['widgetDependencies'] == null
        ? null
        : (json['widgetDependencies'] as List)
            .map((map) => FramyWidgetDependency.fromJson(map))
            .toList();
  }
}

class FramyWidgetDependency {
  final String name;
  final FramyWidgetDependencyType type;
  final dynamic defaultValue;
  final bool isNamed;

  FramyWidgetDependency(this.name, this.type, this.defaultValue, this.isNamed);

  FramyWidgetDependency.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        defaultValue = json['defaultValue'],
        type = FramyWidgetDependencyType.values
            .singleWhere((element) => element.toString() == json['type']),
        isNamed = json['isNamed'];

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'type': type?.toString(),
      'defaultValue': defaultValue,
      'isNamed': isNamed,
    };
  }
}

enum FramyWidgetDependencyType {
  string,
  int,
  num,
  bool,
}

enum FramyObjectType {
  themeData,
  color,
  widget,
}
