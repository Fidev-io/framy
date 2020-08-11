import 'package:framy_annotation/framy_annotation.dart';
import 'package:framy_generator/resolvers/model_resolver.dart';
import 'package:source_gen_test/source_gen_test.dart';

import 'dummy_classes.dart';

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
    "imports": [
      "package:source_gen_test/source_gen_test.dart",
      "package:__test__/dummy_classes.dart",
      "package:framy_annotation/framy_annotation.dart",
      "package:framy_generator/resolvers/model_resolver.dart",
      "dart:core"
    ],
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
    "imports": [
      "package:source_gen_test/source_gen_test.dart",
      "package:__test__/dummy_classes.dart",
      "package:framy_annotation/framy_annotation.dart",
      "package:framy_generator/resolvers/model_resolver.dart",
      "dart:core"
    ],
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
    "imports": [
      "package:source_gen_test/source_gen_test.dart",
      "package:__test__/dummy_classes.dart",
      "package:framy_annotation/framy_annotation.dart",
      "package:framy_generator/resolvers/model_resolver.dart",
      "dart:core"
    ],
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

@ShouldGenerate('''
[
  {
    "type": "FramyObjectType.model",
    "import": "package:__test__/model_resolver_test.dart",
    "imports": [
      "package:source_gen_test/source_gen_test.dart",
      "package:__test__/dummy_classes.dart",
      "package:framy_annotation/framy_annotation.dart",
      "package:framy_generator/resolvers/model_resolver.dart",
      "dart:core"
    ],
    "name": "ClassWithPrivateConstructor",
    "isStatic": false,
    "kind": "CLASS",
    "constructors": [
      {
        "name": "",
        "dependencies": []
      }
    ]
  }
]''')
@FramyModel()
class ClassWithPrivateConstructor {
  ClassWithPrivateConstructor();

  // ignore: unused_element
  ClassWithPrivateConstructor._thisIsPrivate();
}

@ShouldGenerate('''
[
  {
    "type": "FramyObjectType.model",
    "import": "package:__test__/model_resolver_test.dart",
    "imports": [
      "package:source_gen_test/source_gen_test.dart",
      "package:__test__/dummy_classes.dart",
      "package:framy_annotation/framy_annotation.dart",
      "package:framy_generator/resolvers/model_resolver.dart",
      "dart:core"
    ],
    "name": "BuiltUser",
    "isStatic": false,
    "kind": "CLASS",
    "constructors": [
      {
        "name": "",
        "dependencies": [
          {
            "name": "firstName",
            "type": "String",
            "defaultValue": null,
            "isNamed": false,
            "dependencyType": "FramyDependencyType.constructor"
          },
          {
            "name": "lastName",
            "type": "String",
            "defaultValue": null,
            "isNamed": false,
            "dependencyType": "FramyDependencyType.constructor"
          }
        ],
        "isBuiltValue": true
      }
    ]
  }
]''')
@FramyModel()
abstract class BuiltUser implements Built<BuiltUser, BuiltUserBuilder> {
  String get firstName;

  String get lastName;

  // ignore: unused_element
  BuiltUser._();

  factory BuiltUser([Function(BuiltUserBuilder b) updates]) => null;
}
