String generateImports(Set<String> imports) {
  imports.add('package:flutter/foundation.dart');
  imports.add('package:flutter/material.dart');
  String importsStr = '';
  return imports.fold(importsStr, (s, import) => '${s}import \'$import\';\n');
}
