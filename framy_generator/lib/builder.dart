import 'package:build/build.dart';
import 'package:framy_generator/framy_generator.dart';
import 'package:framy_generator/framy_test_generator.dart';
import 'package:framy_generator/json_builder.dart';
import 'package:framy_generator/json_formatter.dart';
import 'package:framy_generator/resolvers/metadata_resolver.dart';
import 'package:framy_generator/resolvers/model_resolver.dart';
import 'package:framy_generator/resolvers/preset_resolver.dart';
import 'package:framy_generator/resolvers/register_riverpod_resolver.dart';
import 'package:framy_generator/resolvers/theme_resolver.dart';
import 'package:framy_generator/resolvers/widget_resolver.dart';
import 'package:source_gen/source_gen.dart';

Builder themeBuilder(BuilderOptions options) {
  return JsonLibraryBuilder(
    ThemeResolver(),
    formatOutput: fixJson,
    generatedExtension: '.theme.framy.json',
    header: '',
  );
}

Builder widgetBuilder(BuilderOptions options) {
  return JsonLibraryBuilder(
    WidgetResolver(),
    formatOutput: fixJson,
    generatedExtension: '.widget.framy.json',
    header: '',
  );
}

Builder modelBuilder(BuilderOptions options) {
  return JsonLibraryBuilder(
    ModelResolver(),
    formatOutput: fixJson,
    generatedExtension: '.model.framy.json',
    header: '',
  );
}

Builder presetBuilder(BuilderOptions options) {
  return JsonLibraryBuilder(
    PresetResolver(),
    formatOutput: fixJson,
    generatedExtension: '.preset.framy.json',
    header: '',
  );
}

Builder registerRiverpodBuilder(BuilderOptions options) {
  return JsonLibraryBuilder(
    RegisterRiverpodResolver(),
    formatOutput: fixJson,
    generatedExtension: '.riverpod.framy.json',
    header: '',
  );
}

Builder metadataBuilder(BuilderOptions options) {
  return JsonLibraryBuilder(
    MetadataResolver(),
    formatOutput: fixJson,
    generatedExtension: '.meta.framy.json',
    header: '',
  );
}

Builder framyAppBuilder(BuilderOptions options) {
  return LibraryBuilder(
    FramyGenerator(),
    generatedExtension: '.app.framy.dart',
  );
}

Builder testBuilder(BuilderOptions options) {
  return LibraryBuilder(
    FramyTestGenerator(),
    generatedExtension: '.test.framy.dart',
  );
}
