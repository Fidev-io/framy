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

    test('should contain isFunction getter', () {
      final result = generateDependencyModel();
      expect(
        result.contains('bool get isFunction => type.contains(\'Function(\');'),
        isTrue,
      );
    });

    test('should contain functionCalls field', () {
      final result = generateDependencyModel();
      expect(result.contains('final functionCalls ='), isTrue);
    });

    test('should contain assignment from function callbacks', () {
      final result = generateDependencyModel();
      expect(result.contains('value = getFunctionCallback(this);'), isTrue);
    });

    test('should contain FramyDependencyFunctionCallsList class', () {
      final result = generateDependencyModel();
      expect(result.contains('class FramyDependencyFunctionCallsList'), isTrue);
    });

    test('should contain FramyDependencyFunctionCall class', () {
      final result = generateDependencyModel();
      expect(result.contains('class FramyDependencyFunctionCall'), isTrue);
    });
  });
}
