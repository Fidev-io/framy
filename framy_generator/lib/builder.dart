import 'package:build/build.dart';
import 'package:framy_generator/framy_dependency_generator.dart';
import 'package:framy_generator/framy_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder dependencyBuilder(BuilderOptions options) {
  return LibraryBuilder(
    FramyDependencyGenerator(),
    generatedExtension: '.framy.json',
  );
}

Builder framyAppBuilder(BuilderOptions options) {
  return LibraryBuilder(
    FramyGenerator(),
    generatedExtension: '.app.framy.dart',
  );
}
