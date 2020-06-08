import 'package:framy_generator/generator/framy_app_generator.dart';
import 'package:test/test.dart';

void main() {
  group('FramyApp Generator result', () {
    test('should start with FramyApp class', () {
      final result = generateFramyApp();
      expect(result.startsWith('class FramyApp'), isTrue);
    });

    test('should contain MaterialApp', () {
      final result = generateFramyApp();
      expect(result.contains('MaterialApp'), isTrue);
    });

    test('should contain FramyApp Key', () {
      final result = generateFramyApp();
      expect(result.contains('Key(\'FramyApp\')'), isTrue);
    });

    test('should contain FramyFontsPage', () {
      final result = generateFramyApp();
      expect(result.contains('FramyFontsPage'), isTrue);
    });

    test('should contain FramyLayoutTemplate', () {
      final result = generateFramyApp();
      expect(result.contains('FramyLayoutTemplate'), isTrue);
    });
  });
}
