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
  final String type;
  final String defaultValueCode;
  final bool isNamed;

  FramyWidgetDependency(
      this.name, this.type, this.defaultValueCode, this.isNamed);

  FramyWidgetDependency.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        defaultValueCode = json['defaultValue'],
        type = json['type'],
        isNamed = json['isNamed'];

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'type': type,
      'defaultValue': defaultValueCode,
      'isNamed': isNamed,
    };
  }
}

enum FramyObjectType {
  themeData,
  color,
  widget,
  model,
}
