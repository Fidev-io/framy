import 'package:framy_annotation/framy_annotation.dart';
import 'package:framy_generator/resolvers/model_resolver.dart';
import 'package:source_gen_test/source_gen_test.dart';

Future<void> main() async {
  final reader = await initializeLibraryReaderForDirectory(
    'test/resolvers',
    'model_resolver_test.dart',
  );

  initializeBuildLogTracking();
  testAnnotatedElements<FramyModel>(
    reader,
    ModelResolver(),
    useDartFormatter: false,
  );
}

@ShouldGenerate('''
[
  {
    "type": "FramyObjectType.enumModel",
    "import": "package:__test__/model_resolver_test.dart",
    "name": "SimpleEnum",
    "isStatic": false,
    "kind": "CLASS",
    "constructors": []
  }
]''')
@FramyModel()
enum SimpleEnum { val1, val2 }
