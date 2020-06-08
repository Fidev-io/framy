import 'package:framy_generator/generator/colors_page_generator.dart';
import 'package:test/test.dart';

void main() {
  group('ColorsPage generator result', () {
    test('should start with FramyColorsPage class', () {
      final result = generateColorsPage();
      expect(result.startsWith('class FramyColorsPage'), isTrue);
    });

    test('should contain key FramyColorsPage', () {
      final result = generateColorsPage();
      expect(result.contains('Key(\'FramyColorsPage\')'), isTrue);
    });
  });
}
