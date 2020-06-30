import 'package:framy_generator/generator/datetime_dependency_input_generator.dart';
import 'package:test/test.dart';

void main() {
  group('generateDateTimeDependencyInput result', () {
    test('should start with FramyDateTimeDependencyInput class', () {
      final result = generateDateTimeDependencyInput();
      expect(result.startsWith('class FramyDateTimeDependencyInput'), isTrue);
    });

    test('should contain InkWell', () {
      final result = generateDateTimeDependencyInput();
      expect(result.contains('InkWell'), isTrue);
    });

    test('should contain showDatePicker', () {
      final result = generateDateTimeDependencyInput();
      expect(result.contains('showDatePicker('), isTrue);
    });
  });
}
