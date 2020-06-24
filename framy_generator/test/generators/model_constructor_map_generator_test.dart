import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/model_constructor_map_generator.dart';
import 'package:test/test.dart';

void main() {
  group('modelConstructorGenerator result', () {
    test('should generate empty map when no models defined', () {
      final result = generateModelConstructorMap([]);
      expect(result, '''
final framyModelConstructorMap =
    <String, dynamic Function(FramyDependencyModel)>{
  
};
''');
    });

    test('should generate a model constructor', () {
      //given
      final stringDependency =
          FramyWidgetDependency('firstName', 'String', null, false);
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

    test('should generate a primitive types constructors', () {
      //when
      final result = generateModelConstructorMap([]);
      //then
      expect(result.contains('\'String\': (dep) => \'\','), isTrue);
      expect(result.contains('\'int\': (dep) => 0,'), isTrue);
      expect(result.contains('\'double\': (dep) => 0.0,'), isTrue);
      expect(result.contains('\'bool\': (dep) => false,'), isTrue);
    });
  });
}
