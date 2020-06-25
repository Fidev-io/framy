import 'package:framy_generator/generator/utils_generator.dart';
import 'package:test/test.dart';

void main() {
  group('generateUtils result', () {
    test('should contain isDependencyAPreset method', () {
      final result = generateUtils();
      expect(result.contains('bool isDependencyAPreset('), isTrue);
    });

    test('should contain isValueAPreset method', () {
      final result = generateUtils();
      expect(result.contains('bool isValueAPreset('), isTrue);
    });
  });
}