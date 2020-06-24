import 'package:framy_generator/framy_object.dart';

String generateImports(List<FramyObject> framyObjects) {
  Set<String> imports = {};
  imports.add('package:flutter/foundation.dart');
  imports.add('package:flutter/material.dart');
  framyObjects.forEach((object) {
    imports.add(object.import);
    if (object.type == FramyObjectType.widget &&
        object.widgetDependencies.any((element) =>
            element.dependencyType == FramyWidgetDependencyType.provider)) {
      imports.add('package:provider/provider.dart');
    }
  });
  String importsStr = '';
  return imports.fold(importsStr, (s, import) => '${s}import \'$import\';\n');
}
