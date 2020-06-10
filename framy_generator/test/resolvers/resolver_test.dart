import 'package:framy_annotation/framy_annotation.dart';
import 'package:framy_generator/theme_resolver.dart';
import 'package:source_gen_test/source_gen_test.dart';

import '../dummy_flutter_classes/color.dart';
import '../dummy_flutter_classes/theme_data.dart';

Future<void> main() async {
  final reader = await initializeLibraryReaderForDirectory(
    'test/resolvers',
    'resolver_test.dart',
  );

  initializeBuildLogTracking();
  testAnnotatedElements<FramyTheme>(
    reader,
    ThemeResolver(),
    useDartFormatter: false,
  );
}

@ShouldGenerate('''
[
  {
    "type": "FramyObjectType.themeData",
    "import": "package:__test__/resolver_test.dart",
    "name": "getThemeData",
    "isStatic": true,
    "kind": "FUNCTION"
  }
]''')
@FramyTheme()
ThemeData getThemeData() => ThemeData(errorColor: Color(0xFFFF0000));

@ShouldThrow('Framy annotations cannot be applied to private methods')
@FramyTheme()
ThemeData _privateThemeData() => ThemeData();
