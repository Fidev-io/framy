import 'package:analyzer/dart/element/element.dart';

/// Returns the import which points to a given [element]
String getImport(Element element) {
  // prefer library source, because otherwise "part of"-files will lead to
  // compile errors due to bad imports in the generated code
  final source = element.librarySource ?? element.source;

  //return early if element has no source
  if (source == null) {
    return null;
  }

  // we don't need to import core dart types
  // or core flutter types
  if (!source.isInSystemLibrary) {
    final path = source.uri.toString();

    return path;
  }
  return null;
}
