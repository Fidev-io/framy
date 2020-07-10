import 'package:framy_generator/generator/main_generator.dart';
import 'package:test/test.dart';

void main() {
  group('Main generator result', () {
    test('should generate proper main with passed key', () {
      //when
      final result = generateMain(false);
      //then
      final expectedResult = '''
void main() {
  runApp(FramyApp(key: framyAppStateKey));
}
''';
      expect(result, equals(expectedResult));
    });

    test('should add a ProviderScope when there are riverpod dependencies', () {
      //when
      final result = generateMain(true);
      //then
      expect(result.contains('ProviderScope'), isTrue);
    });
  });
}
