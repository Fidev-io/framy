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
    "kind": "ENUM",
    "constructors": []
  }
]''')
@FramyModel()
enum SimpleEnum { val1, val2 }

@ShouldGenerate('''
[
  {
    "type": "FramyObjectType.model",
    "import": "package:__test__/model_resolver_test.dart",
    "name": "ClassWithTwoConstructors",
    "isStatic": false,
    "kind": "CLASS",
    "constructors": [
      {
        "name": "",
        "dependencies": []
      },
      {
        "name": ".secondConstructor",
        "dependencies": []
      }
    ]
  }
]''')
@FramyModel()
class ClassWithTwoConstructors {
  ClassWithTwoConstructors();
  ClassWithTwoConstructors.secondConstructor();
}

@ShouldGenerate('''
[
  {
    "type": "FramyObjectType.model",
    "import": "package:__test__/model_resolver_test.dart",
    "name": "ClassWithTwoConstructorsWithDependencies",
    "isStatic": false,
    "kind": "CLASS",
    "constructors": [
      {
        "name": ".first",
        "dependencies": [
          {
            "name": "a",
            "type": "int",
            "defaultValue": null,
            "isNamed": false,
            "dependencyType": "FramyDependencyType.constructor"
          }
        ]
      },
      {
        "name": ".second",
        "dependencies": [
          {
            "name": "b",
            "type": "String",
            "defaultValue": null,
            "isNamed": false,
            "dependencyType": "FramyDependencyType.constructor"
          }
        ]
      }
    ]
  }
]''')
@FramyModel()
class ClassWithTwoConstructorsWithDependencies {
  ClassWithTwoConstructorsWithDependencies.first(int a);
  ClassWithTwoConstructorsWithDependencies.second(String b);
}
