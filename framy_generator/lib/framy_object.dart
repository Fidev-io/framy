import 'package:analyzer/dart/element/element.dart';
import 'package:framy_generator/utils.dart';

export 'package:analyzer/dart/element/element.dart';

class FramyObject {
  FramyObjectType type;

//  List<String> dependencyImports;
  String import;
  String name;

//  String page;
//  String group;
//  String constructor;
  bool isStatic;
  ElementKind kind;

  FramyObject parentObject;

  FramyObject();

  FramyObject.fromElement(Element element)
      : import = getImport(element),
        name = element.displayName,
        kind = element.kind,
//        dependencyImports = element.library.importedLibraries
//            .map((lib) => lib.location.toString())
//            .toList(),
        isStatic = (element is ExecutableElement && element.isStatic) ||
            (element is FieldElement && element.isStatic);

//
  Map<String, dynamic> toMap() {
    return {
      'type': type?.toString(),
      'import': import,
      'name': name,
//      'page': page,
//      'dependencyImports': dependencyImports,
//      'group': group,
      'isStatic': isStatic,
//      'constructor': constructor,
      'kind': kind.toString(),
      'parentObject': parentObject?.toMap(),
    };
  }

//
  FramyObject.fromJson(Map<String, dynamic> json) {
    type = FramyObjectType.values.singleWhere(
      (type) => type?.toString() == json['type'],
      orElse: () => null,
    );
    import = json['import'];
    name = json['name'];
//    page = json['page'];
//    group = json['grup'];
//    dependencyImports = List.from(json['dependencyImports'] ?? []);
    isStatic = json['isStatic'];
//    constructor = json['constructor'];
    kind = ElementKind.values
        .singleWhere((kind) => kind.toString() == json['kind']);
    parentObject = json['parentObject'] == null
        ? null
        : FramyObject.fromJson(json['parentObject']);
  }
}

//
enum FramyObjectType {
  themeData,
  color,
  widget,
//  widgets,
}
