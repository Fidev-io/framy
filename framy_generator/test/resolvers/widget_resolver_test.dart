import 'package:framy_annotation/framy_annotation.dart';
import 'package:framy_generator/widget_resolver.dart';
import 'package:source_gen_test/source_gen_test.dart';

Future<void> main() async {
  final reader = await initializeLibraryReaderForDirectory(
    'test/resolvers',
    'widget_resolver_test.dart',
  );

  initializeBuildLogTracking();
  testAnnotatedElements<FramyWidget>(
    reader,
    WidgetResolver(),
    useDartFormatter: false,
  );
}

@ShouldGenerate('''
[
  {
    "type": "FramyObjectType.widget",
    "import": "package:__test__/widget_resolver_test.dart",
    "name": "CounterFloatingActionButton",
    "isStatic": false,
    "kind": "CLASS",
    "parentObject": null
  }
]''')
@FramyWidget()
class CounterFloatingActionButton {}
