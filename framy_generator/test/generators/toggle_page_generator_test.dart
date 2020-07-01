import 'package:framy_generator/generator/toggle_page_generator.dart';
import 'package:test/test.dart';

void main() {
  group('TogglePage generator result', () {
    test('should start with FramyTogglePage class', () {
      final result = generateTogglePage();
      expect(result.startsWith('class FramyTogglePage'), isTrue);
    });

    test('should contain key FramyColorsPage', () {
      final result = generateTogglePage();
      expect(result.contains('Key(\'FramyTogglePage\')'), isTrue);
    });
  });
}
