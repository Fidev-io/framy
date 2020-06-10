import 'package:framy_generator/framy_object.dart';

String generateImports(List<FramyObject> framyObjects) {
  Set<String> imports = {};
  imports.add('package:flutter/foundation.dart');
  imports.add('package:flutter/material.dart');
  framyObjects.forEach((object) => imports.add(object.import));
  String importsStr = '';
  return imports.fold(importsStr, (s, import) => '${s}import \'$import\';\n');
}
