import 'package:framy_generator/generator/main_generator.dart';
import 'package:test/test.dart';

void main() {
  group('Main generator result', () {
    test('should generate proper main', () {
      //when
      final result = generateMain();
      //then
      final expectedResult = '''
void main() {
  runApp(FramyApp());
}
''';
      expect(result, equals(expectedResult));
    });
  });
}
