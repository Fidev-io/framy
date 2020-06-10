import 'package:framy_generator/framy_object.dart';
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

    test('should contain onGenerateRoute', () {
      final result = generateFramyApp();
      expect(result.contains('onGenerateRoute'), isTrue);
    });

    test('should not contain theme when empty list passed', () {
      final result = generateFramyApp([]);
      expect(result.contains('theme'), isFalse);
    });

    test('should contain theme when passed', () {
      //given
      final themeDataObject = FramyObject()..name = 'getThemeData';
      //when
      final result = generateFramyApp([themeDataObject]);
      //then
      expect(result.contains('theme: getThemeData(),'), isTrue);
    });
  });
}
