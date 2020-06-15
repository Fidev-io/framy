import 'package:framy_generator/json_formatter.dart';
import 'package:test/test.dart';

void main() {
  group('fixJson', () {
    final generatedJson = '''
[
  {
    "name": "TestWidget",
  }
]''';
    test('should return the same string when only one element', () {
      //when
      final formattedJson = fixJson(generatedJson);
      //then
      expect(formattedJson, generatedJson);
    });

    test('should combine two lists of elements into one', () {
      //given
      final multipleJsons = '$generatedJson\n\n$generatedJson';
      //when
      final formattedJson = fixJson(multipleJsons);
      //then
      final expectedJson = '''
[
  {
    "name": "TestWidget",
  },
  {
    "name": "TestWidget",
  }
]''';
      expect(formattedJson, expectedJson);
    });
  });
}
