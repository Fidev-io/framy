import 'package:framy_generator/generator/framy_app_generator.dart';
import 'package:test/test.dart';

void main() {
  group('FramyApp Generator result', () {
    test('should start with FramyApp class', () {
      //when
      final result = generateFramyApp();
      //then
      expect(result.startsWith('class FramyApp'), isTrue);
    });

    test('should contain MaterialApp', () {
      //when
      final result = generateFramyApp();
      //then
      expect(result.contains('MaterialApp'), isTrue);
    });

    test('should contain FramyApp Key', () {
      //when
      final result = generateFramyApp();
      //then
      expect(result.contains('Key(\'FramyApp\')'), isTrue);
    });

    test('should contain FramyAppBar', () {
      //when
      final result = generateFramyApp();
      //then
      expect(result.contains('FramyAppBar'), isTrue);
    });

    test('should contain FramyFontsPage', () {
      //when
      final result = generateFramyApp();
      //then
      expect(result.contains('FramyFontsPage'), isTrue);
    });

    test('should contain FramyDrawer or null', () {
      //when
      final result = generateFramyApp();
      //then
      expect(result.contains('FramyDrawer() : null'), isTrue);
    });

    test('should contain LayoutBuilder', () {
      //when
      final result = generateFramyApp();
      //then
      expect(result.contains('LayoutBuilder'), isTrue);
    });

    // one for small screens, one for big screens
    test('should contain two FramyDrawers', () {
      //when
      final String result = generateFramyApp();
      //then
      expect("FramyDrawer".allMatches(result), hasLength(2));
    });
  });
}
