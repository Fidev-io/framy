import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/subdependencies_map_generator.dart';
import 'package:test/test.dart';

void main() {
  group('subDependenciesMapGenerator result', () {
    test('should generate a switch for model', () {
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
      final result = generateSubDependenciesMap(framyModelObjects);
      //then
      expect(result.contains('case \'User\':'), isTrue);
    });

    test('should generate subDependency row', () {
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
      final result = generateSubDependenciesMap(framyModelObjects);
      //then
      expect(
          result.contains(
              'FramyDependencyModel<String>(\'firstName\', \'String\', null, createSubDependencies(\'String\')),\n'),
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
      final result = generateSubDependenciesMap(framyModelObjects);
      //then
      expect(result.contains('FooModel'), isFalse);
    });

    test('should contain default empty list', () {
      //given
      final framyModelObjects = [
        FramyObject()
          ..name = 'FooModel'
          ..type = FramyObjectType.model
          ..constructors = [FramyObjectConstructor('', [])]
      ];
      //when
      final result = generateSubDependenciesMap(framyModelObjects);
      //then
      expect(result.contains('default: return [];'), isFalse);
    });
  });
}
