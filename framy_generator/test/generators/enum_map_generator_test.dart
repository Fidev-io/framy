import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/enum_map_generator.dart';
import 'package:test/test.dart';

void main() {
  group('generateEnumMap result', () {
    test('should contain map declaration', () {
      final result = generateEnumMap([]);
      expect(result.contains('final framyEnumMap = <String, List<dynamic>>{'),
          isTrue);
    });

    test('should contain default Material enums', () {
      //given
      final materialEnums = ['MaterialTapTargetSize'];
      //when
      final result = generateEnumMap([]);
      //then
      materialEnums.forEach((enumName) {
        expect(result.contains('\'$enumName\': $enumName.values,'), isTrue);
      });
    });

    test('should contain passed enum models', () {
      //given
      final enumModel = FramyObject()
        ..name = 'Foo'
        ..type = FramyObjectType.enumModel;
      //when
      final result = generateEnumMap([enumModel]);
      //then
      expect(result.contains('\'Foo\': Foo.values,'), isTrue);
    });

    test('should not contain passed non-enum models', () {
      //given
      final classModel = FramyObject()
        ..name = 'Foo'
        ..type = FramyObjectType.model;
      //when
      final result = generateEnumMap([classModel]);
      //then
      expect(result.contains('\'Foo\': Foo.values,'), isFalse);
    });
  });
}
