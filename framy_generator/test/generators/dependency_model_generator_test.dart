import 'package:framy_generator/generator/dependency_model_generator.dart';
import 'package:test/test.dart';

void main() {
  group('generateDependencyModel result', () {
    test('should contain FramyDependencyModel class', () {
      final result = generateDependencyModel();
      expect(result.startsWith('class FramyDependencyModel<T> '), isTrue);
    });

    test('should contain listType getter', () {
      final result = generateDependencyModel();
      expect(result.contains('String get listType'), isTrue);
    });

    test('should have updateValue method', () {
      final result = generateDependencyModel();
      expect(result.contains('void updateValue()'), isTrue);
    });

    test('should contain createSubDependencies', () {
      final result = generateDependencyModel();
      expect(
          result.contains('createSubDependencies(type, constructor)'), isTrue);
    });

    test('should look for framyAvailableConstructorNames', () {
      final result = generateDependencyModel();
      expect(result.contains('framyAvailableConstructorNames'), isTrue);
    });
  });
}
