import 'package:framy_generator/generator/constructor_dropdown_generator.dart';
import 'package:test/test.dart';

void main() {
  group('generateConstructorDropdown result', () {
    test('should start with FramyConstructorDropdown class', () {
      final result = generateConstructorDropdown();
      expect(result.startsWith('class FramyConstructorDropdown'), isTrue);
    });

    test('should contain DropdownButton', () {
      final result = generateConstructorDropdown();
      expect(result.contains('DropdownButton'), isTrue);
    });

    test('should contain framyAvailableConstructorNames reference', () {
      final result = generateConstructorDropdown();
      expect(result.contains('framyAvailableConstructorNames'), isTrue);
    });

    test('should contain Default label string', () {
      final result = generateConstructorDropdown();
      expect(result.contains('\'Default\''), isTrue);
    });

    test('should contain updateValue call', () {
      final result = generateConstructorDropdown();
      expect(result.contains('dependency.updateValue();'), isTrue);
    });
  });
}
