import 'package:framy_generator/generator/button_page_generator.dart';
import 'package:test/test.dart';

void main() {
  group('ButtonPage generator result', () {
    test('should start with FramyButtonPage class', () {
      final result = generateButtonPage();
      expect(result.startsWith('class FramyButtonPage'), isTrue);
    });

    test('should contain key FramyButtonPage', () {
      final result = generateButtonPage();
      expect(result.contains('Key(\'FramyButtonPage\')'), isTrue);
    });
  });
}
