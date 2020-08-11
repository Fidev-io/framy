import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/model_constructor_map_generator.dart';
import 'package:test/test.dart';

void main() {
  group('modelConstructorGenerator result', () {
    test('should contain mapped enum values', () {
      final result = generateModelConstructorMap([]);
      expect(
        result.contains(
            '...framyEnumMap.map((type, values) => MapEntry(type, (FramyDependencyModel dep) => values.first)),'),
        isTrue,
      );
    });

    test('should generate a model constructor', () {
      //given
      final stringDependency =
          FramyObjectDependency('firstName', 'String', null, false);
      final framyModelObjects = [
        FramyObject()
          ..name = 'User'
          ..type = FramyObjectType.model
          ..constructors = [
            FramyObjectConstructor('', [stringDependency])
          ]
      ];
      //when
      final result = generateModelConstructorMap(framyModelObjects);
      //then
      expect(
          result.contains(RegExp(
              'User\\(\n *dep\\.subDependencies\\.singleWhere\\(\\(d\\) => d\\.name == \'firstName\'\\)\\.value,')),
          isTrue);
    });

    test('should ignore enumModels', () {
      //given
      final framyModelObjects = [
        FramyObject()
          ..name = 'FooModel'
          ..type = FramyObjectType.enumModel
          ..constructors = [FramyObjectConstructor('', [])]
      ];
      //when
      final result = generateModelConstructorMap(framyModelObjects);
      //then
      expect(result.contains('FooModel'), isFalse);
    });

    test('should generate a primitive types constructors', () {
      //when
      final result = generateModelConstructorMap([]);
      //then
      expect(result.contains('\'String\': (dep) => \'\','), isTrue);
      expect(result.contains('\'int\': (dep) => 0,'), isTrue);
      expect(result.contains('\'double\': (dep) => 0.0,'), isTrue);
      expect(result.contains('\'bool\': (dep) => false,'), isTrue);
    });

    test('should generate if statement for unnamed constructor', () {
      //given
      final framyModelObjects = [
        FramyObject()
          ..name = 'User'
          ..type = FramyObjectType.model
          ..constructors = [FramyObjectConstructor('', [])]
      ];
      //when
      final result = generateModelConstructorMap(framyModelObjects);
      //then
      expect(result.contains('if (dep.constructor == \'\')'), isTrue);
    });

    test('should have else return null', () {
      //given
      final framyModelObjects = [
        FramyObject()
          ..name = 'User'
          ..type = FramyObjectType.model
          ..constructors = [FramyObjectConstructor('', [])]
      ];
      //when
      final result = generateModelConstructorMap(framyModelObjects);
      //then
      expect(result.contains('else return null;'), isTrue);
    });

    test('should generate builder method for builtValue constructors', () {
      //given
      final framyModelObjects = [
        FramyObject()
          ..name = 'BuiltUser'
          ..type = FramyObjectType.model
          ..constructors = [
            FramyObjectConstructor(
              '',
              [
                FramyObjectDependency('firstName', 'String', 'null', false),
                FramyObjectDependency('lastName', 'String', 'null', false),
              ],
              isBuiltValue: true,
            )
          ]
      ];
      //when
      final result = generateModelConstructorMap(framyModelObjects);
      //then
      expect(result.contains('BuiltUser(\n    (b) => b'), isTrue);
      expect(
          result.contains(
              "..firstName = dep.subDependencies.singleWhere((d) => d.name == 'firstName').value"),
          isTrue);
      expect(
          result.contains(
              "..lastName = dep.subDependencies.singleWhere((d) => d.name == 'lastName').value"),
          isTrue);
    });
  });
}
