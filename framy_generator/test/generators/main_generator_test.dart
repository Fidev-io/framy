import 'package:framy_generator/generator/main_generator.dart';
import 'package:test/test.dart';

void main() {
  group('Main generator result', () {
    test('should generate proper main with passed key', () {
      //when
      final String result = generateMain();
      //then
      final expectedResult = '''
void main() {
  runApp(FramyApp(key: framyAppStateKey));
}
''';
      expect(result, equals(expectedResult));
    });
  });
}
