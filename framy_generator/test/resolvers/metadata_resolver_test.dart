import 'package:framy_annotation/framy_annotation.dart';
import 'package:framy_generator/resolvers/metadata_resolver.dart';
import 'package:source_gen_test/source_gen_test.dart';

Future<void> main() async {
  final reader = await initializeLibraryReaderForDirectory(
    'test/resolvers',
    'metadata_resolver_test.dart',
  );

  initializeBuildLogTracking();
  testAnnotatedElements<FramyApp>(
    reader,
    MetadataResolver(),
    useDartFormatter: false,
  );
}

@ShouldGenerate('''
{"pathToFramyApp":"package:__test__/metadata_resolver_test.app.framy.dart"}''')
@FramyApp()
class MyApp {}
