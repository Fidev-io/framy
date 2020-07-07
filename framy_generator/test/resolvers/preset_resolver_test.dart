import 'package:framy_annotation/framy_annotation.dart';
import 'package:framy_generator/resolvers/preset_resolver.dart';
import 'package:source_gen_test/source_gen_test.dart';

import 'dummy_classes.dart';

Future<void> main() async {
  final reader = await initializeLibraryReaderForDirectory(
    'test/resolvers',
    'preset_resolver_test.dart',
  );

  initializeBuildLogTracking();
  testAnnotatedElements<FramyPreset>(
    reader,
    PresetResolver(),
    useDartFormatter: false,
  );
}

@ShouldGenerate('''
[
  {
    "type": "FramyObjectType.preset",
    "import": "package:__test__/preset_resolver_test.dart",
    "imports": [
      "package:source_gen_test/source_gen_test.dart",
      "package:__test__/dummy_classes.dart",
      "package:framy_annotation/framy_annotation.dart",
      "dart:core",
      "package:framy_generator/resolvers/preset_resolver.dart"
    ],
    "name": "authenticatedUser",
    "isStatic": true,
    "kind": "FUNCTION",
    "returnType": "User"
  }
]''')
@FramyPreset()
User authenticatedUser() => User()..firstName = 'John';

@ShouldThrow('Framy annotations cannot be applied to private methods')
@FramyPreset()
// ignore: unused_element
User _authenticatedUser() => User()..firstName = 'John';

@ShouldThrow('Framy preset can be applied only to functions and methods')
@FramyPreset()
User fieldUser = User()..firstName = 'John';
