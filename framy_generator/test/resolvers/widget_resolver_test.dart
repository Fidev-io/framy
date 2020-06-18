import 'package:framy_annotation/framy_annotation.dart';
import 'package:framy_generator/resolvers/widget_resolver.dart';
import 'package:source_gen_test/source_gen_test.dart';

import 'dummy_classes.dart';

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
    "parentObject": null,
    "widgetDependencies": []
  }
]''')
@FramyWidget()
class CounterFloatingActionButton {}

@ShouldGenerate('''
[
  {
    "type": "FramyObjectType.widget",
    "import": "package:__test__/widget_resolver_test.dart",
    "name": "WidgetWithConstructor",
    "isStatic": false,
    "kind": "CLASS",
    "parentObject": null,
    "widgetDependencies": [
      {
        "name": "arg1",
        "type": "FramyWidgetDependencyType.string",
        "defaultValue": null,
        "isNamed": false
      }
    ]
  }
]''')
@FramyWidget()
class WidgetWithConstructor {
  WidgetWithConstructor(String arg1) {}
}

@ShouldGenerate('''
[
  {
    "type": "FramyObjectType.widget",
    "import": "package:__test__/widget_resolver_test.dart",
    "name": "WidgetWithConstructorAndKey",
    "isStatic": false,
    "kind": "CLASS",
    "parentObject": null,
    "widgetDependencies": [
      {
        "name": "arg1",
        "type": "FramyWidgetDependencyType.string",
        "defaultValue": null,
        "isNamed": true
      }
    ]
  }
]''')
@FramyWidget()
class WidgetWithConstructorAndKey {
  WidgetWithConstructorAndKey({Key key, String arg1}) {}
}

@ShouldGenerate('''
[
  {
    "type": "FramyObjectType.widget",
    "import": "package:__test__/widget_resolver_test.dart",
    "name": "WidgetWithConstructorWithDefaultParamValue",
    "isStatic": false,
    "kind": "CLASS",
    "parentObject": null,
    "widgetDependencies": [
      {
        "name": "arg1",
        "type": "FramyWidgetDependencyType.string",
        "defaultValue": "'test1'",
        "isNamed": true
      }
    ]
  }
]''')
@FramyWidget()
class WidgetWithConstructorWithDefaultParamValue {
  WidgetWithConstructorWithDefaultParamValue({String arg1 = 'test1'}) {}
}

@ShouldGenerate('"type": "FramyWidgetDependencyType.int"', contains: true)
@FramyWidget()
class WidgetWithIntParam {
  WidgetWithIntParam(int arg1) {}
}

@ShouldGenerate('"type": "FramyWidgetDependencyType.double"', contains: true)
@FramyWidget()
class WidgetWithDoubleParam {
  WidgetWithDoubleParam(double arg1) {}
}

@ShouldGenerate('"type": "FramyWidgetDependencyType.double"', contains: true)
@FramyWidget()
class WidgetWithNumParam {
  WidgetWithNumParam(num arg1) {}
}

@ShouldGenerate('"type": "FramyWidgetDependencyType.bool"', contains: true)
@FramyWidget()
class WidgetWithBoolParam {
  WidgetWithBoolParam(bool arg1) {}
}
