import 'package:build/build.dart';
import 'package:framy_generator/framy_dependency_generator.dart';
import 'package:framy_generator/framy_generator.dart';
import 'package:framy_generator/json_builder.dart';
import 'package:framy_generator/theme_resolver.dart';
import 'package:source_gen/source_gen.dart';

Builder themeBuilder(BuilderOptions options) {
  return JsonLibraryBuilder(
    ThemeResolver(),
    formatOutput: (s) => s,
    generatedExtension: '.theme.framy.json',
    header: '',
  );
}

Builder dependencyBuilder(BuilderOptions options) {
  return LibraryBuilder(
    FramyDependencyGenerator(),
    generatedExtension: '.other.framy.json',
  );
}

Builder framyAppBuilder(BuilderOptions options) {
  return LibraryBuilder(
    FramyGenerator(),
    generatedExtension: '.app.framy.dart',
  );
}
