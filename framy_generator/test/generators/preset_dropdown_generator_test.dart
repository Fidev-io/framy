import 'package:framy_generator/generator/preset_dropdown_generator.dart';
import 'package:test/test.dart';

void main() {
  group('PresetDropdownGenerator result', () {
    test('should start with class FramyPresetDropdown', () {
      final result = generatePresetDropdown();
      expect(result.startsWith('class FramyPresetDropdown'), isTrue);
    });

    test('should contain DropdownButton', () {
      final result = generatePresetDropdown();
      expect(result.contains('DropdownButton'), isTrue);
    });

    test('should contain check for isFunction', () {
      final result = generatePresetDropdown();
      expect(result.contains('dependency.isFunction'), isTrue);
    });

    test('should contain Logger label', () {
      final result = generatePresetDropdown();
      expect(result.contains('\'Logger\''), isTrue);
    });
  });
}
