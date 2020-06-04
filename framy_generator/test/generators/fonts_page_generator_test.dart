import 'package:framy_generator/generator/fonts_page_generator.dart';
import 'package:test/test.dart';

void main() {
  group('FontsPage generator result', () {
    test('should start with class definition', () {
      //when
      final String result = generateFontsPage();
      //then
      expect(result.startsWith('class FramyFontsPage '), isTrue);
    });

    test('should have key', () {
      //when
      final String result = generateFontsPage();
      //then
      expect(result.contains('Key(\'FramyFontsPage\')'), isTrue);
    });
  });
}
