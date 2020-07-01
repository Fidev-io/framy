import 'package:framy_generator/generator/text_field_generator.dart';
import 'package:test/test.dart';

void main() {
  group('TextFieldPage generator result', () {
    test('should contain class FramyTextFieldPage', () {
      String result = generateTextFieldPage();
      expect(result.contains('class FramyTextFieldPage'), isTrue);
    });
  });
}