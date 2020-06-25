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
      final stringDependency = FramyWidgetDependency('firstName', 'String',
          null, false, FramyWidgetDependencyType.constructor);
      final framyModelObjects = [
        FramyObject()
          ..name = 'User'
          ..type = FramyObjectType.model
          ..widgetDependencies = [stringDependency]
      ];
      //when
      final result = generateModelConstructorMap(framyModelObjects);
      //then
      expect(
          result.contains(RegExp(
              '\'User\': \\(dep\\) => User\\(\n *dep\\.subDependencies\\.singleWhere\\(\\(d\\) => d\\.name == \'firstName\'\\)\\.value,')),
          isTrue);
    });

    test('should ignore enumModels', () {
      //given
      final framyModelObjects = [
        FramyObject()
          ..name = 'FooModel'
          ..type = FramyObjectType.enumModel
          ..widgetDependencies = []
      ];
      //when
      final result = generateModelConstructorMap(framyModelObjects);
      //then
      expect(result.contains('FooModel'), isFalse);
    });
  });
}
