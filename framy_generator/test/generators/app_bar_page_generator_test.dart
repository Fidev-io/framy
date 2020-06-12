import 'package:framy_generator/generator/app_bar_page_generator.dart';
import 'package:test/test.dart';

void main() {
  group('AppBarPage generator result', () {
    test('should contain FramyAppBarPage class', () {
      final result = generateAppBarPage();
      expect(result.startsWith('class FramyAppBarPage'), isTrue);
    });

    test('should contain key FramyAppBarPage', () {
      final result = generateAppBarPage();
      expect(result.contains('Key(\'FramyAppBarPage\')'), isTrue);
    });
  });
}
