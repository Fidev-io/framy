import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/available_constructor_names_generator.dart';
import 'package:test/test.dart';

void main() {
  group('generateAvailableConstructorNames result', () {
    test('should contain map of <String, List<String>>', () {
      final result = generateAvailableConstructorNames([]);
      expect(
        result.contains(
            'Map<String, List<String>> framyAvailableConstructorNames'),
        isTrue,
      );
    });

    test('should add list of constructors for a model', () {
      //given
      final modelObject = FramyObject()
        ..name = 'Foo'
        ..constructors = [
          FramyObjectConstructor('', []),
          FramyObjectConstructor('.fromJson', []),
        ];
      //when
      final result = generateAvailableConstructorNames([modelObject]);
      //then
      expect(result.contains("'Foo': ['', '.fromJson'],"), isTrue);
    });

    test('should skip models with no constructors', () {
      //given
      final modelObject = FramyObject()
        ..name = 'FooNoConstructor'
        ..constructors = [];
      //when
      final result = generateAvailableConstructorNames([modelObject]);
      //then
      expect(result.contains('FooNoConstructor'), isFalse);
    });
  });
}
