import 'package:framy_annotation/framy_annotation.dart';
import 'package:framy_generator/resolvers/register_riverpod_resolver.dart';
import 'package:source_gen_test/source_gen_test.dart';

import 'dummy_classes.dart';

Future<void> main() async {
  final reader = await initializeLibraryReaderForDirectory(
    'test/resolvers',
    'register_riverpod_resolver_test.dart',
  );

  initializeBuildLogTracking();
  testAnnotatedElements<FramyRegisterRiverpod>(
    reader,
    RegisterRiverpodResolver(),
    useDartFormatter: false,
  );
}

@ShouldGenerate('''
[
  {
    "type": "FramyObjectType.riverpod",
    "import": "package:__test__/register_riverpod_resolver_test.dart",
    "imports": [
      "package:source_gen_test/source_gen_test.dart",
      "package:__test__/dummy_classes.dart",
      "package:framy_annotation/framy_annotation.dart",
      "dart:core",
      "package:framy_generator/resolvers/register_riverpod_resolver.dart"
    ],
    "name": "simpleProvider",
    "isStatic": false,
    "kind": "TOP_LEVEL_VARIABLE",
    "returnType": "String"
  }
]''')
@FramyRegisterRiverpod()
final simpleProvider = Provider((ref) => 'Value');
