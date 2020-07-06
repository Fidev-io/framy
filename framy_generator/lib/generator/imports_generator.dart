import 'package:framy_generator/framy_object.dart';

String generateImports(List<FramyObject> framyObjects, {bool useDevicePreview = false}) {
  Set<String> imports = {};
  imports.add('package:flutter/foundation.dart');
  imports.add('package:flutter/material.dart');
  if (useDevicePreview) {
    imports.add('package:device_preview/device_preview.dart');
  }
  framyObjects.forEach((object) {
    imports.add(object.import);
    if (object.type == FramyObjectType.widget &&
        object.constructors.first.dependencies.any((element) =>
            element.dependencyType == FramyDependencyType.provider)) {
      imports.add('package:provider/provider.dart');
    }
  });
  String importsStr = '';
  return imports.fold(importsStr, (s, import) => '${s}import \'$import\';\n');
}
