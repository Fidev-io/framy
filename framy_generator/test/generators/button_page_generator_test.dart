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

    test('should contain 2 RaisedButtons', () {
      final result = generateButtonPage();
      expect('RaisedButton('.allMatches(result), hasLength(2));
    });

    test('should contain Raised button header', () {
      final result = generateButtonPage();
      expect(
          result.contains('const FramyHeaderText(\'Raised button\'),'), isTrue);
    });

    test('should contain 2 FlatButtons', () {
      final result = generateButtonPage();
      expect('FlatButton('.allMatches(result), hasLength(2));
    });

    test('should contain Flat button header', () {
      final result = generateButtonPage();
      expect(
          result.contains('const FramyHeaderText(\'Flat button\'),'), isTrue);
    });

    test('should contain 2 OutlineButtons', () {
      final result = generateButtonPage();
      expect('OutlineButton('.allMatches(result), hasLength(2));
    });

    test('should contain Outline button header', () {
      final result = generateButtonPage();
      expect(result.contains('const FramyHeaderText(\'Outline button\'),'),
          isTrue);
    });

    test('should contain 3 FloatingActionButtons', () {
      final result = generateButtonPage();
      expect('FloatingActionButton'.allMatches(result), hasLength(3));
    });

    test('should contain Floating Action Button header', () {
      final result = generateButtonPage();
      expect(
          result.contains('const FramyHeaderText(\'Floating Action Button\'),'),
          isTrue);
    });

    test('should contain 2 IconButtons', () {
      final result = generateButtonPage();
      expect('IconButton('.allMatches(result), hasLength(2));
    });

    test('should contain Icon button header', () {
      final result = generateButtonPage();
      expect(
          result.contains('const FramyHeaderText(\'Icon button\'),'), isTrue);
    });

    test('should contain Dropdown button header', () {
      final result = generateButtonPage();
      expect(
          result.contains('const FramyHeaderText(\'Dropdown button\'),'), isTrue);
    });

    test('should contain Dropdown button', () {
      final result = generateButtonPage();
      expect(result.contains('DropdownButton('), isTrue);
    });
  });
}
