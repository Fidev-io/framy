import 'package:framy_generator/generator/app_bar_page_generator.dart';
import 'package:test/test.dart';

void main() {
  group('AppBarPage generator result', () {
    test('should start with FramyAppBarPage class', () {
      final result = generateAppBarPage();
      expect(result.startsWith('class FramyAppBarPage'), isTrue);
    });

    test('should contain key FramyAppBarPage', () {
      final result = generateAppBarPage();
      expect(result.contains('Key(\'FramyAppBarPage\')'), isTrue);
    });

    test('should contain 4 AppBars', () {
      final result = generateAppBarPage();
      expect('AppBar('.allMatches(result), hasLength(4));
    });

    test('should contain header', () {
      final result = generateAppBarPage();
      expect(result.contains('const FramyHeaderText(\'AppBar\'),'), isTrue);
    });
  });
}
