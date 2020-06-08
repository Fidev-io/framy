import 'package:framy_generator/generator/framy_app_generator.dart';
import 'package:test/test.dart';

void main() {
  group('FramyApp Generator result', () {
    test('should start with FramyApp class', () {
      //when
      final String result = generateFramyApp();
      //then
      expect(result.startsWith('class FramyApp'), isTrue);
    });

    test('should contain MaterialApp', () {
      //when
      final String result = generateFramyApp();
      //then
      expect(result.contains('MaterialApp'), isTrue);
    });

    test('should contain FramyAppBar', () {
      //when
      final String result = generateFramyApp();
      //then
      expect(result.contains('FramyAppBar'), isTrue);
    });

    test('should contain FramyFontsPage', () {
      //when
      final String result = generateFramyApp();
      //then
      expect(result.contains('FramyFontsPage'), isTrue);
    });

    test('should contain FramyDrawer', () {
      //when
      final String result = generateFramyApp();
      //then
      expect(result.contains('drawer: FramyDrawer()'), isTrue);
    });
  });
}
